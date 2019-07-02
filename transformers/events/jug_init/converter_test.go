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

package jug_init_test

import (
	"github.com/ethereum/go-ethereum/core/types"
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
	"github.com/vulcanize/mcd_transformers/transformers/events/jug_init"
	"github.com/vulcanize/mcd_transformers/transformers/test_data"
)

var _ = Describe("Jug init converter", func() {
	var converter = jug_init.JugInitConverter{}

	It("returns err if log is missing topics", func() {
		incompleteLog := types.Log{}
		_, err := converter.ToModels([]types.Log{incompleteLog})
		Expect(err).To(HaveOccurred())
	})

	It("convert a log to an insertion model", func() {
		models, err := converter.ToModels([]types.Log{test_data.EthJugInitLog})
		Expect(err).NotTo(HaveOccurred())
		//Expect(models).To(Equal([]shared.InsertionModel{test_data.JugInitModel}))
		actual := models[0]
		expected := test_data.JugInitModel

		Expect(actual.TableName).To(Equal(expected.TableName))
		Expect(actual.OrderedColumns).To(Equal(expected.OrderedColumns))
		Expect(actual.ForeignKeyToValue).To(Equal(expected.ForeignKeyToValue))
		Expect(actual.ColumnToValue["log_idx"]).To(Equal(expected.ColumnToValue["log_idx"]))
		Expect(actual.ColumnToValue["tx_idx"]).To(Equal(expected.ColumnToValue["tx_idx"]))
		Expect(actual.ColumnToValue["raw_log"]).To(Equal(expected.ColumnToValue["raw_log"]))
	})
})
