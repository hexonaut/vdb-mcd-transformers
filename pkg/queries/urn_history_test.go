package queries_test

import (
	"database/sql"
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
	. "github.com/vulcanize/mcd_transformers/pkg/queries/test_helpers"
	"github.com/vulcanize/mcd_transformers/test_config"
	"github.com/vulcanize/mcd_transformers/transformers/shared/constants"
	"github.com/vulcanize/mcd_transformers/transformers/storage/pit"
	"github.com/vulcanize/mcd_transformers/transformers/storage/vat"
	"github.com/vulcanize/mcd_transformers/transformers/test_data"
	"github.com/vulcanize/vulcanizedb/libraries/shared/storage/utils"
	"github.com/vulcanize/vulcanizedb/pkg/datastore/postgres"
	"github.com/vulcanize/vulcanizedb/pkg/datastore/postgres/repositories"
	"github.com/vulcanize/vulcanizedb/pkg/fakes"
	"math/rand"
	"strconv"
)

var _ = Describe("Urn history query", func() {
	var (
		db         *postgres.DB
		vatRepo    vat.VatStorageRepository
		pitRepo    pit.PitStorageRepository
		headerRepo repositories.HeaderRepository
		fakeUrn    string
		fakeIlk    string
	)

	BeforeEach(func() {
		db = test_config.NewTestDB(test_config.NewTestNode())
		headerRepo = repositories.NewHeaderRepository(db)
		vatRepo = vat.VatStorageRepository{}
		vatRepo.SetDB(db)
		pitRepo = pit.PitStorageRepository{}
		pitRepo.SetDB(db)

		fakeIlk = test_data.RandomString(5)
		fakeUrn = test_data.RandomString(5)
	})

	It("returns a reverse chronological history for the given ilk and urn", func() {
		blockOne := rand.Int()
		timestampOne := rand.Int()
		urnSetupData := GetUrnSetupData(blockOne, timestampOne)
		urnMetadata := GetUrnMetadata(fakeIlk, fakeUrn)
		CreateUrn(urnSetupData, urnMetadata, vatRepo, pitRepo, headerRepo)

		expectedRatioOne := GetExpectedRatio(urnSetupData.Ink, urnSetupData.Spot, urnSetupData.Art, urnSetupData.Rate)

		// New block
		blockTwo := blockOne + 1
		timestampTwo := timestampOne + 1
		createFakeHeader(blockTwo, timestampTwo, headerRepo)

		// Relevant ink diff in block two
		inkTwo := rand.Int()
		err := vatRepo.Create(blockTwo, fakes.FakeHash.String(), urnMetadata.UrnInk, strconv.Itoa(inkTwo))
		Expect(err).NotTo(HaveOccurred())

		expectedRatioTwo := GetExpectedRatio(inkTwo, urnSetupData.Spot, urnSetupData.Art, urnSetupData.Rate)

		// Irrelevant ink diff in block two
		wrongUrn := test_data.RandomString(5)
		wrongInk := strconv.Itoa(rand.Int())
		wrongMetadata := utils.GetStorageValueMetadata(vat.UrnInk,
			map[utils.Key]string{constants.Ilk: fakeIlk, constants.Guy: wrongUrn}, utils.Uint256)
		err = vatRepo.Create(blockOne, fakes.FakeHash.String(), wrongMetadata, wrongInk)
		Expect(err).NotTo(HaveOccurred())

		// New block
		blockThree := blockTwo + 1
		timestampThree := timestampTwo + 1
		createFakeHeader(blockThree, timestampThree, headerRepo)

		// Relevant art diff in block three
		artTwo := 0
		err = vatRepo.Create(blockThree, fakes.FakeHash.String(), urnMetadata.UrnArt, strconv.Itoa(artTwo))
		Expect(err).NotTo(HaveOccurred())

		// Relevant ink diff in block three
		inkThree := rand.Int()
		err = vatRepo.Create(blockThree, fakes.FakeHash.String(), urnMetadata.UrnInk, strconv.Itoa(inkThree))
		Expect(err).NotTo(HaveOccurred())

		// Reverse chronological order
		expectedUrnChanges := []UrnState{
			{
				UrnId:       fakeUrn,
				IlkId:       fakeIlk,
				BlockHeight: blockThree,
				Ink:         strconv.Itoa(inkThree),
				Art:         strconv.Itoa(artTwo),
				Ratio:       sql.NullString{Valid: false}, // 0 art => null ratio
				Safe:        true,                         // 0 art => safe urn
				Created:     sql.NullString{String: strconv.Itoa(timestampOne), Valid: true},
				Updated:     sql.NullString{String: strconv.Itoa(timestampThree), Valid: true},
			},
			{
				UrnId:       fakeUrn,
				IlkId:       fakeIlk,
				BlockHeight: blockTwo,
				Ink:         strconv.Itoa(inkTwo),
				Art:         strconv.Itoa(urnSetupData.Art),
				Ratio:       sql.NullString{Valid: false}, // float; checked approximately below
				Safe:        expectedRatioTwo >= 1,
				Created:     sql.NullString{String: strconv.Itoa(timestampOne), Valid: true},
				Updated:     sql.NullString{String: strconv.Itoa(timestampTwo), Valid: true},
			},
			{
				UrnId:       fakeUrn,
				IlkId:       fakeIlk,
				BlockHeight: blockOne,
				Ink:         strconv.Itoa(urnSetupData.Ink),
				Art:         strconv.Itoa(urnSetupData.Art),
				Ratio:       sql.NullString{Valid: false}, // float; checked approximately below
				Safe:        expectedRatioOne >= 1,
				Created:     sql.NullString{String: strconv.Itoa(timestampOne), Valid: true},
				Updated:     sql.NullString{String: strconv.Itoa(timestampOne), Valid: true},
			},
		}

		var result []UrnState
		dbErr := db.Select(&result,
			`SELECT * FROM maker.get_urn_history_before_block($1, $2, $3)`,
			fakeIlk, fakeUrn, blockThree)
		Expect(dbErr).NotTo(HaveOccurred())

		// Extract actual ratios
		actualRatioTwo, err := strconv.ParseFloat(result[1].Ratio.String, 64)
		Expect(err).NotTo(HaveOccurred())
		result[1].Ratio = sql.NullString{Valid: false}

		actualRatioThree, err := strconv.ParseFloat(result[2].Ratio.String, 64)
		Expect(err).NotTo(HaveOccurred())
		result[2].Ratio = sql.NullString{Valid: false}

		Expect(result).To(Equal(expectedUrnChanges))
		// Check ratios one and two approximately
		Expect(actualRatioTwo).To(BeNumerically("~", expectedRatioTwo))
		Expect(actualRatioThree).To(BeNumerically("~", expectedRatioOne))
	})
})

func createFakeHeader(blockNumber, timestamp int, headerRepo repositories.HeaderRepository) {
	fakeHeaderOne := fakes.GetFakeHeader(int64(blockNumber))
	fakeHeaderOne.Timestamp = strconv.Itoa(timestamp)

	_, headerErr := headerRepo.CreateOrUpdateHeader(fakeHeaderOne)
	Expect(headerErr).NotTo(HaveOccurred())
}
