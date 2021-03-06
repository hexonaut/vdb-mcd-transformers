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

package spot_test

import (
	"math/big"

	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/crypto"
	"github.com/makerdao/vdb-mcd-transformers/transformers/shared/constants"
	"github.com/makerdao/vdb-mcd-transformers/transformers/storage/spot"
	"github.com/makerdao/vdb-mcd-transformers/transformers/storage/test_helpers"
	"github.com/makerdao/vdb-mcd-transformers/transformers/storage/utilities/wards"
	"github.com/makerdao/vdb-mcd-transformers/transformers/test_data"
	"github.com/makerdao/vulcanizedb/libraries/shared/factories/storage"
	"github.com/makerdao/vulcanizedb/libraries/shared/storage/types"
	"github.com/makerdao/vulcanizedb/pkg/fakes"
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
)

var _ = Describe("spot storage keys loader", func() {
	var (
		storageRepository *test_helpers.MockMakerStorageRepository
		storageKeysLoader storage.KeysLoader
	)

	BeforeEach(func() {
		storageRepository = &test_helpers.MockMakerStorageRepository{}
		storageKeysLoader = spot.NewKeysLoader(storageRepository, test_data.SpotAddress())
	})

	It("returns value metadata for static keys", func() {
		mappings, err := storageKeysLoader.LoadMappings()

		Expect(err).NotTo(HaveOccurred())
		Expect(mappings[spot.VatKey]).To(Equal(spot.VatMetadata))
		Expect(mappings[spot.ParKey]).To(Equal(spot.ParMetadata))
		Expect(mappings[spot.LiveKey]).To(Equal(spot.LiveMetadata))
	})

	Describe("wards", func() {
		It("returns value metadata for wards", func() {
			wardsUser := fakes.FakeAddress.Hex()
			storageRepository.WardsKeys = []string{wardsUser}
			paddedWardsUser := "0x000000000000000000000000" + wardsUser[2:]
			wardsKey := common.BytesToHash(crypto.Keccak256(common.FromHex(paddedWardsUser + wards.WardsMappingIndex)))
			expectedMetadata := types.ValueMetadata{
				Name: wards.Wards,
				Keys: map[types.Key]string{constants.User: fakes.FakeAddress.Hex()},
				Type: types.Uint256,
			}

			mappings, err := storageKeysLoader.LoadMappings()
			Expect(err).NotTo(HaveOccurred())

			Expect(storageRepository.GetWardsKeysCalledWith).To(Equal(test_data.SpotAddress()))
			Expect(mappings[wardsKey]).To(Equal(expectedMetadata))
		})

		Describe("when getting users fails", func() {
			It("returns error", func() {
				storageRepository.GetWardsKeysError = fakes.FakeError

				_, err := storageKeysLoader.LoadMappings()

				Expect(err).To(HaveOccurred())
				Expect(err).To(MatchError(fakes.FakeError))
			})
		})
	})

	Describe("when getting ilks fails", func() {
		It("returns error", func() {
			storageRepository.GetIlksError = fakes.FakeError

			_, err := storageKeysLoader.LoadMappings()

			Expect(err).To(MatchError(fakes.FakeError))
		})
	})

	Describe("when getting ilks succeeds", func() {
		It("returns value metadata for pip", func() {
			fakeIlk := "fakeIlk"
			storageRepository.Ilks = []string{fakeIlk}
			ilkPipKey := common.BytesToHash(crypto.Keccak256(common.FromHex("0x" + fakeIlk + spot.IlkMappingIndex)))
			expectedMetadata := types.ValueMetadata{
				Name: spot.IlkPip,
				Keys: map[types.Key]string{constants.Ilk: fakeIlk},
				Type: types.Address,
			}

			mappings, err := storageKeysLoader.LoadMappings()

			Expect(err).NotTo(HaveOccurred())
			Expect(mappings[ilkPipKey]).To(Equal(expectedMetadata))
		})

		It("returns value metadata for mat", func() {
			fakeIlk := "fakeIlk"
			storageRepository.Ilks = []string{fakeIlk}
			ilkPipKeyBytes := crypto.Keccak256(common.FromHex("0x" + fakeIlk + spot.IlkMappingIndex))
			ilkPipAsInt := big.NewInt(0).SetBytes(ilkPipKeyBytes)
			incrementedIlkPip := big.NewInt(0).Add(ilkPipAsInt, big.NewInt(1))
			ilkMatKey := common.BytesToHash(incrementedIlkPip.Bytes())
			expectedMetadata := types.ValueMetadata{
				Name: spot.IlkMat,
				Keys: map[types.Key]string{constants.Ilk: fakeIlk},
				Type: types.Uint256,
			}

			mappings, err := storageKeysLoader.LoadMappings()

			Expect(err).NotTo(HaveOccurred())
			Expect(mappings[ilkMatKey]).To(Equal(expectedMetadata))
		})
	})
})
