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

package jug_drip_test

import (
	"strconv"

	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"

	"github.com/vulcanize/vulcanizedb/pkg/datastore"
	"github.com/vulcanize/vulcanizedb/pkg/datastore/postgres"
	"github.com/vulcanize/vulcanizedb/pkg/datastore/postgres/repositories"
	"github.com/vulcanize/vulcanizedb/pkg/fakes"

	"github.com/vulcanize/mcd_transformers/test_config"
	"github.com/vulcanize/mcd_transformers/transformers/events/jug_drip"
	"github.com/vulcanize/mcd_transformers/transformers/shared"
	"github.com/vulcanize/mcd_transformers/transformers/shared/constants"
	"github.com/vulcanize/mcd_transformers/transformers/test_data"
	"github.com/vulcanize/mcd_transformers/transformers/test_data/shared_behaviors"
)

var _ = Describe("Jug drip repository", func() {
	var (
		db                *postgres.DB
		jugDripRepository jug_drip.JugDripRepository
		headerRepository  datastore.HeaderRepository
	)

	BeforeEach(func() {
		db = test_config.NewTestDB(test_config.NewTestNode())
		test_config.CleanTestDB(db)
		headerRepository = repositories.NewHeaderRepository(db)
		jugDripRepository = jug_drip.JugDripRepository{}
		jugDripRepository.SetDB(db)
	})

	Describe("Create", func() {
		modelWithDifferentLogIdx := test_data.JugDripModel
		modelWithDifferentLogIdx.LogIndex++
		inputs := shared_behaviors.CreateBehaviorInputs{
			CheckedHeaderColumnName:  constants.JugDripChecked,
			LogEventTableName:        "maker.jug_drip",
			TestModel:                test_data.JugDripModel,
			ModelWithDifferentLogIdx: modelWithDifferentLogIdx,
			Repository:               &jugDripRepository,
		}

		shared_behaviors.SharedRepositoryCreateBehaviors(&inputs)

		It("adds a jug drip event", func() {
			headerID, err := headerRepository.CreateOrUpdateHeader(fakes.FakeHeader)
			Expect(err).NotTo(HaveOccurred())
			err = jugDripRepository.Create(headerID, []interface{}{test_data.JugDripModel})

			Expect(err).NotTo(HaveOccurred())
			var dbJugDrip jug_drip.JugDripModel
			err = db.Get(&dbJugDrip, `SELECT ilk_id, log_idx, tx_idx, raw_log FROM maker.jug_drip WHERE header_id = $1`, headerID)
			Expect(err).NotTo(HaveOccurred())
			ilkID, err := shared.GetOrCreateIlk(test_data.JugDripModel.Ilk, db)
			Expect(err).NotTo(HaveOccurred())
			Expect(dbJugDrip.Ilk).To(Equal(strconv.Itoa(ilkID)))
			Expect(dbJugDrip.LogIndex).To(Equal(test_data.JugDripModel.LogIndex))
			Expect(dbJugDrip.TransactionIndex).To(Equal(test_data.JugDripModel.TransactionIndex))
			Expect(dbJugDrip.Raw).To(MatchJSON(test_data.JugDripModel.Raw))
		})
	})

	Describe("MarkHeaderChecked", func() {
		inputs := shared_behaviors.MarkedHeaderCheckedBehaviorInputs{
			CheckedHeaderColumnName: constants.JugDripChecked,
			Repository:              &jugDripRepository,
		}

		shared_behaviors.SharedRepositoryMarkHeaderCheckedBehaviors(&inputs)
	})
})
