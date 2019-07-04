// VulcanizeDB
// Copyright © 2019 Vulcanize

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

package vat_frob

import (
	repo "github.com/vulcanize/vulcanizedb/libraries/shared/repository"
	"github.com/vulcanize/vulcanizedb/pkg/datastore/postgres"

	"github.com/vulcanize/mcd_transformers/transformers/shared"
	"github.com/vulcanize/mcd_transformers/transformers/shared/constants"
)

const (
	InsertVatFrobQuery = `INSERT INTO maker.vat_frob (header_id, urn_id, v, w, dink, dart, raw_log, log_idx, tx_idx)
		VALUES($1, $2::NUMERIC, $3, $4, $5::NUMERIC, $6::NUMERIC, $7, $8, $9)
		ON CONFLICT (header_id, tx_idx, log_idx)
		DO UPDATE SET urn_id = $2, v = $3, w = $4, dink = $5, dart = $6, raw_log = $7;`
)

type VatFrobRepository struct {
	db *postgres.DB
}

func (repository VatFrobRepository) Create(headerID int64, models []shared.InsertionModel) error {
	return shared.Create(headerID, models, repository.db)
}

func (repository VatFrobRepository) MarkHeaderChecked(headerID int64) error {
	return repo.MarkHeaderChecked(headerID, repository.db, constants.VatFrobChecked)
}

func (repository *VatFrobRepository) SetDB(db *postgres.DB) {
	repository.db = db
}
