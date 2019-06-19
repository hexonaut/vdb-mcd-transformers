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

package shared_test

import (
	"encoding/json"
	"fmt"
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
	"github.com/vulcanize/mcd_transformers/test_config"
	"github.com/vulcanize/mcd_transformers/transformers/component_tests/queries/test_helpers"
    "github.com/vulcanize/mcd_transformers/transformers/shared"
    "github.com/vulcanize/vulcanizedb/pkg/datastore/postgres"
	"github.com/vulcanize/vulcanizedb/pkg/datastore/postgres/repositories"
	"github.com/vulcanize/vulcanizedb/pkg/fakes"
)

var _ = Describe("Create function ...", func() {
	const createTestEventTableQuery = `CREATE TABLE maker.testEvent(
        id        SERIAL PRIMARY KEY,
        header_id INTEGER NOT NULL REFERENCES headers (id) ON DELETE CASCADE,
        variable1 TEXT,
	    ilk_id    INTEGER NOT NULL,
	    urn_id    INTEGER NOT NULL,
        log_idx   INTEGER NOT NULL,
        tx_idx    INTEGER NOT NULL,
        raw_log   JSONB,
        UNIQUE (header_id, tx_idx, log_idx)
        );`
	const addCheckedColumnQuery = `ALTER TABLE public.checked_headers
		ADD COLUMN testevent_checked INTEGER NOT NULL DEFAULT 0;`

	var (
		headerRepository repositories.HeaderRepository
		testModel        shared.InsertionModel
		db               *postgres.DB
	)

	BeforeEach(func() {
		db = test_config.NewTestDB(test_config.NewTestNode())
		test_config.CleanTestDB(db)
		_, _ = db.Exec(createTestEventTableQuery)
		_, _ = db.Exec(addCheckedColumnQuery)
		headerRepository = repositories.NewHeaderRepository(db)

		fakeLog, _ := json.Marshal("fake log")
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
	})

	AfterEach(func() {
		db.MustExec(`DROP TABLE maker.testEvent;`)
		db.MustExec(`ALTER TABLE public.checked_headers DROP COLUMN testevent_checked;`)
	})

	It("persists a model to postgres", func() {
		header := fakes.GetFakeHeader(1)
		headerID, headerErr := headerRepository.CreateOrUpdateHeader(header)
		Expect(headerErr).NotTo(HaveOccurred())

		createErr := shared.Create(headerID, []shared.InsertionModel{testModel}, db)
		Expect(createErr).NotTo(HaveOccurred())

		var res TestEvent
		dbErr := db.Get(&res, `SELECT header_id, log_idx, tx_idx, raw_log, ilk_id, urn_id, variable1
            FROM maker.testEvent;`)
        Expect(dbErr).NotTo(HaveOccurred())
        fmt.Println(res)
	})
})

type TestEvent struct {
	HeaderId  string `db:"header_id"`
	LogIdx    string `db:"log_idx"`
	TxIdx     string `db:"tx_idx"`
	RawLog    string `db:"raw_log"`
	IlkId     string `db:"ilk_id"`
	UrnId     string `db:"urn_id"`
	Variable1 string
}
