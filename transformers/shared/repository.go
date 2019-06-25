// VulcanizeDB
// Copyright © 2018 Vulcanize

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.

// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

package shared

import (
	"database/sql"
	"fmt"
	"github.com/jmoiron/sqlx"
	log "github.com/sirupsen/logrus"
	"github.com/vulcanize/vulcanizedb/libraries/shared/repository"
	"github.com/vulcanize/vulcanizedb/pkg/datastore/postgres"
	"strconv"
	"strings"
)

const (
	getIlkIdQuery  = `SELECT id FROM maker.ilks WHERE ilk = $1`
	getUrnIdQuery  = `SELECT id FROM maker.urns WHERE identifier = $1 AND ilk_id = $2`
	InsertIlkQuery = `INSERT INTO maker.ilks (ilk, identifier) VALUES ($1, $2) RETURNING id`
	InsertUrnQuery = `INSERT INTO maker.urns (identifier, ilk_id) VALUES ($1, $2) RETURNING id`
)

type InsertionModel struct {
	TableName      string                 // For MarkHeaderChecked, insert query
	OrderedColumns []string               // Defines the fields to insert, and in which order the table expects them
	// ColumnToValue needs to be typed interface{}, since `raw_log` is a slice of bytes and not a string
	ColumnToValue  map[string]interface{} // Associated values for columns, some "magic" populated automatically
	IlkIdentifier  string                 // For inserting ilk and getting id, empty if not required
	UrnIdentifier  string                 // For inserting ilk and getting id, empty if not required
}

// Creates an insertion query from an insertion model
// Note: With extraction of event metadata, one would not have to supply header_id, tx_idx, etc in InsertionModel.OrderedColumns?
// Note: I have a feeling we can actually do away with the OrderedColumns field, but the tricky part is that some fields
//       needed aren't present in the map in the beginning
// TODO not run this on every Create?
func generateInsertionQuery(model InsertionModel) string {
	var valuePlaceholders []string
	var updateOnConflict []string
	for i := 0; i < len(model.OrderedColumns); i++ {
		valuePlaceholder := fmt.Sprintf("$%d", 1+i)
		valuePlaceholders = append(valuePlaceholders, valuePlaceholder)
		updateOnConflict = append(updateOnConflict,
			fmt.Sprintf("%s = %s", model.OrderedColumns[i], valuePlaceholder))
	}

	baseQuery := `INSERT INTO maker.%v (%v) VALUES(%v)
		ON CONFLICT (header_id, tx_idx, log_idx) DO UPDATE SET %v;`
	return fmt.Sprintf(baseQuery,
		model.TableName,
		strings.Join(model.OrderedColumns, ", "),
		strings.Join(valuePlaceholders, ", "),
		strings.Join(updateOnConflict, ", "))
}

/* Given an instance of InsertionModel, example below, generates an insertion query and fills in
header_id, ilk_id, urn_id automatically after getting from the DB. These "special fields" are populated in the
columnToValue mapping, and are treated like any other in the insertion.

testModel = shared.InsertionModel{
    TableName:      "testEvent",
    OrderedColumns: []string{"header_id", "log_idx", "tx_idx", "raw_log", "ilk_id", "urn_id", "variable1"},
    ColumnToValue: map[string]interface{}{
        "log_idx":   "1",
        "tx_idx":    "2",
        "raw_log":   fakeLog,
        "variable1": "value1",
        },
    IlkIdentifier: test_helpers.FakeIlk.Hex,
    UrnIdentifier: "0x12345",
}
*/
func Create(headerID int64, models []InsertionModel, db *postgres.DB) error {
	if len(models) < 1 {
		return fmt.Errorf("repository got empty model slice")
	}

	tx, dBaseErr := db.Beginx()
	if dBaseErr != nil {
		return dBaseErr
	}

	var checkedHeaderColumn string
	for _, model := range models {
		var (
			ilkID  int
			ilkErr error
			urnID  int
			urnErr error
		)

		// Quick 'n' dirty solution to these not being declared in config.
		// a) Couldn't we somewhere create the table and add a checked column inside the plugin, instead of a migration?
		// b) By defining the checked column to be tableName_checked, we can do away with all the strings anyway :)
		if checkedHeaderColumn == "" {
			checkedHeaderColumn = model.TableName + "_checked"
		}

		// Save headerId in mapping for insertion query
		model.ColumnToValue["header_id"] = strconv.FormatInt(headerID, 10)
		if model.IlkIdentifier != "" {
			ilkID, ilkErr = GetOrCreateIlkInTransaction(model.IlkIdentifier, tx)
			if ilkErr != nil {
				rollbackErr := tx.Rollback()
				if rollbackErr != nil {
					log.Error("failed to rollback ", rollbackErr)
				}
				return ilkErr
			}
			// Save id in mapping for insertion query
			model.ColumnToValue["ilk_id"] = ilkID
		}

		// if an urn identifier is supplied in the model, create/lookup it's id
		if model.UrnIdentifier != "" {
			urnID, urnErr = GetOrCreateUrnInTransaction(model.UrnIdentifier, ilkID, tx)
			if urnErr != nil {
				rollbackErr := tx.Rollback()
				if rollbackErr != nil {
					log.Error("failed to rollback", rollbackErr)
				}
				return urnErr
			}
			// Save id in mapping for insertion query
			model.ColumnToValue["urn_id"] = urnID
		}

		// Maps can't be iterated over in a reliable manner, so we rely on OrderedColumns to define the order to insert
		// tx.Exec is variadically typed in the args, so if we wrap in []interface{} we can apply them all automatically
		var args []interface{}
		for _, col := range model.OrderedColumns {
			args = append(args, model.ColumnToValue[col])
		}

		_, execErr := tx.Exec(generateInsertionQuery(model), args...) //couldn't do this trick with []string for example

		if execErr != nil {
			rollbackErr := tx.Rollback()
			if rollbackErr != nil {
				log.Error("failed to rollback ", rollbackErr)
			}
			return execErr
		}
	}

	checkHeaderErr := repository.MarkHeaderCheckedInTransaction(headerID, tx, checkedHeaderColumn)
	if checkHeaderErr != nil {
		rollbackErr := tx.Rollback()
		if rollbackErr != nil {
			log.Error("failed to rollback ", rollbackErr)
		}
		return checkHeaderErr
	}
	return tx.Commit()
}

func GetOrCreateIlk(ilk string, db *postgres.DB) (int, error) {
	var ilkID int
	err := db.Get(&ilkID, getIlkIdQuery, ilk)
	if err == sql.ErrNoRows {
		ilkIdentifier := DecodeHexToText(ilk)
		insertErr := db.QueryRow(InsertIlkQuery, ilk, ilkIdentifier).Scan(&ilkID)
		return ilkID, insertErr
	}
	return ilkID, err
}

func GetOrCreateIlkInTransaction(ilk string, tx *sqlx.Tx) (int, error) {
	var ilkID int
	err := tx.Get(&ilkID, getIlkIdQuery, ilk)
	if err == sql.ErrNoRows {
		ilkIdentifier := DecodeHexToText(ilk)
		insertErr := tx.QueryRow(InsertIlkQuery, ilk, ilkIdentifier).Scan(&ilkID)
		return ilkID, insertErr
	}
	return ilkID, err
}

func GetOrCreateUrn(guy string, ilkID int, db *postgres.DB) (int, error) {
	var urnID int
	err := db.Get(&urnID, getUrnIdQuery, guy, ilkID)
	if err != nil {
		if err == sql.ErrNoRows {
			insertErr := db.QueryRow(InsertUrnQuery, guy, ilkID).Scan(&urnID)
			return urnID, insertErr
		}
	}

	return urnID, err
}

func GetOrCreateUrnInTransaction(guy string, ilkID int, tx *sqlx.Tx) (int, error) {
	var urnID int
	err := tx.Get(&urnID, getUrnIdQuery, guy, ilkID)

	if err != nil {
		if err == sql.ErrNoRows {
			insertErr := tx.QueryRow(InsertUrnQuery, guy, ilkID).Scan(&urnID)
			return urnID, insertErr
		}
	}

	return urnID, err
}
