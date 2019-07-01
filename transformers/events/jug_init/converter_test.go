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
	"fmt"
	"github.com/ethereum/go-ethereum/core/types"
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
	"github.com/vulcanize/mcd_transformers/transformers/shared"

	"github.com/vulcanize/mcd_transformers/transformers/events/jug_init"
	"github.com/vulcanize/mcd_transformers/transformers/test_data"
)

var _ = Describe("Jug init converter", func() {
	It("returns err if log is missing topics", func() {
		converter := jug_init.JugInitConverter{}
		incompleteLog := types.Log{}

		_, err := converter.ToModels([]types.Log{incompleteLog})

		Expect(err).To(HaveOccurred())
	})

	It("convert a log to an insertion model", func() {
		converter := jug_init.JugInitConverter{}

		models, err := converter.ToModels([]types.Log{test_data.EthJugInitLog})
		Expect(err).NotTo(HaveOccurred())

		expectedModel := shared.InsertionModel{
			TableName:      "jug_init",
			OrderedColumns: []string{"header_id", "ilk_id", "log_idx", "tx_idx", "raw_log"},
			ColumnToValue: map[string]interface{}{
				"log_idx": 11,
				"tx_idx":  10,
				"raw_log": test_data.RawJugInitLog,
			},
			ForeignKeyToValue: map[string]string{
				"ilk_id": "0x434f4c352d410000000000000000000000000000000000000000000000000000",
			},
		}

		Expect(len(models)).To(Equal(1))
		Expect(fmt.Sprint(models[0])).To(Equal(fmt.Sprint(expectedModel)))
	})
})
