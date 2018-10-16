/*
 *  Copyright 2018 Vulcanize
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

package bite_test

import (
	"encoding/json"
	"github.com/ethereum/go-ethereum/core/types"
	"github.com/vulcanize/vulcanizedb/pkg/transformers/bite"
	"github.com/vulcanize/vulcanizedb/pkg/transformers/test_data"

	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
	"github.com/vulcanize/vulcanizedb/pkg/transformers/shared"
)

var _ = Describe("Bite Converter", func() {
	var converter = bite.BiteConverter{}

	Describe("ToEntity", func() {
		It("converts an eth log to a bite entity", func() {
			entities, err := converter.ToEntities(shared.CatABI, []types.Log{test_data.EthBiteLog})

			Expect(err).NotTo(HaveOccurred())
			Expect(len(entities)).To(Equal(1))
			entity := entities[0]
			Expect(entity.Ilk).To(Equal(test_data.BiteEntity.Ilk))
			Expect(entity.Urn).To(Equal(test_data.BiteEntity.Urn))
			Expect(entity.Ink).To(Equal(test_data.BiteEntity.Ink))
			Expect(entity.Art).To(Equal(test_data.BiteEntity.Art))
			Expect(entity.Tab).To(Equal(test_data.BiteEntity.Tab))
			Expect(entity.Flip).To(Equal(test_data.BiteEntity.Flip))
			Expect(entity.IArt).To(Equal(test_data.BiteEntity.IArt))
			Expect(entity.TransactionIndex).To(Equal(test_data.BiteEntity.TransactionIndex))
			Expect(entity.Raw).To(Equal(test_data.BiteEntity.Raw))
		})

		It("returns an error if converting log to entity fails", func() {
			_, err := converter.ToEntities("error abi", []types.Log{test_data.EthBiteLog})

			Expect(err).To(HaveOccurred())
		})
	})

	Describe("ToModel", func() {
		var emptyEntity = bite.BiteEntity{}

		It("converts an Entity to a Model", func() {
			models, err := converter.ToModels([]bite.BiteEntity{test_data.BiteEntity})

			Expect(err).NotTo(HaveOccurred())
			Expect(len(models)).To(Equal(1))
			model := models[0]
			Expect(model).To(Equal(test_data.BiteModel))
		})

		It("handles nil values", func() {
			emptyLog, err := json.Marshal(types.Log{})
			Expect(err).NotTo(HaveOccurred())
			expectedModel := bite.BiteModel{
				Ilk:              "0x0000000000000000000000000000000000000000",
				Urn:              "0x0000000000000000000000000000000000000000",
				Ink:              "",
				Art:              "",
				IArt:             "",
				Tab:              "",
				NFlip:            "",
				TransactionIndex: 0,
				Raw:              string(emptyLog),
			}
			models, err := converter.ToModels([]bite.BiteEntity{emptyEntity})

			Expect(err).NotTo(HaveOccurred())
			Expect(len(models)).To(Equal(1))
			model := models[0]
			Expect(model).To(Equal(expectedModel))
		})
	})
})
