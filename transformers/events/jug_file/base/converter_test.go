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

package base_test

import (
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"

	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/core/types"

	"github.com/vulcanize/mcd_transformers/transformers/events/jug_file/base"
	"github.com/vulcanize/mcd_transformers/transformers/test_data"
)

var _ = Describe("Jug file base converter", func() {
	It("returns err if log missing topics", func() {
		converter := base.JugFileBaseConverter{}
		badLog := types.Log{
			Topics: []common.Hash{{}},
			Data:   []byte{1, 1, 1, 1, 1},
		}

		_, err := converter.ToModels([]types.Log{badLog})

		Expect(err).To(HaveOccurred())
	})

	It("converts a log to a model", func() {
		converter := base.JugFileBaseConverter{}

		models, err := converter.ToModels([]types.Log{test_data.EthJugFileBaseLog})

		Expect(err).NotTo(HaveOccurred())
		Expect(len(models)).To(Equal(1))
		Expect(models[0].(base.JugFileBaseModel)).To(Equal(test_data.JugFileBaseModel))
	})
})