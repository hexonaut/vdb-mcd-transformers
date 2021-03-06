package pot_test

import (
	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/crypto"
	"github.com/makerdao/vdb-mcd-transformers/transformers/shared/constants"
	"github.com/makerdao/vdb-mcd-transformers/transformers/storage/pot"
	"github.com/makerdao/vdb-mcd-transformers/transformers/storage/test_helpers"
	"github.com/makerdao/vdb-mcd-transformers/transformers/storage/utilities/wards"
	"github.com/makerdao/vdb-mcd-transformers/transformers/test_data"
	"github.com/makerdao/vulcanizedb/libraries/shared/factories/storage"
	"github.com/makerdao/vulcanizedb/libraries/shared/storage/types"
	"github.com/makerdao/vulcanizedb/pkg/fakes"
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
)

var _ = Describe("pot storage keys loader", func() {
	var (
		storageRepository *test_helpers.MockMakerStorageRepository
		storageKeysLoader storage.KeysLoader
	)

	BeforeEach(func() {
		storageRepository = &test_helpers.MockMakerStorageRepository{}
		storageKeysLoader = pot.NewKeysLoader(storageRepository, test_data.PotAddress())
	})

	It("returns value metadata for static keys", func() {
		mappings, err := storageKeysLoader.LoadMappings()

		Expect(err).NotTo(HaveOccurred())
		Expect(mappings[pot.PieKey]).To(Equal(pot.PieMetadata))
		Expect(mappings[pot.DsrKey]).To(Equal(pot.DsrMetadata))
		Expect(mappings[pot.ChiKey]).To(Equal(pot.ChiMetadata))
		Expect(mappings[pot.VatKey]).To(Equal(pot.VatMetadata))
		Expect(mappings[pot.VowKey]).To(Equal(pot.VowMetadata))
		Expect(mappings[pot.RhoKey]).To(Equal(pot.RhoMetadata))
		Expect(mappings[pot.LiveKey]).To(Equal(pot.LiveMetadata))
	})

	Describe("when getting users fails", func() {
		It("returns error", func() {
			storageRepository.GetPotPieUsersError = fakes.FakeError

			_, err := storageKeysLoader.LoadMappings()

			Expect(err).To(MatchError(fakes.FakeError))
		})
	})

	Describe("when getting users succeeds", func() {
		It("returns value metadata for user pie", func() {
			fakeUser := "0x" + fakes.RandomString(40)
			paddedUser := "0x000000000000000000000000" + fakeUser[2:]
			storageRepository.PotPieUsers = []string{fakeUser}
			userPieKey := common.BytesToHash(crypto.Keccak256(common.FromHex(paddedUser + pot.UserPieIndex)))
			expectedMetadata := types.ValueMetadata{
				Name: pot.UserPie,
				Keys: map[types.Key]string{constants.MsgSender: fakeUser},
				Type: types.Uint256,
			}

			mappings, err := storageKeysLoader.LoadMappings()

			Expect(err).NotTo(HaveOccurred())
			Expect(mappings[userPieKey]).To(Equal(expectedMetadata))
		})
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

			Expect(storageRepository.GetWardsKeysCalledWith).To(Equal(test_data.PotAddress()))
			Expect(mappings[wardsKey]).To(Equal(expectedMetadata))
		})
	})
})
