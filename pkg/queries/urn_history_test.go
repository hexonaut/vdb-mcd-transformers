package queries_test

import (
	"database/sql"
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
	"github.com/vulcanize/mcd_transformers/test_config"
	"github.com/vulcanize/mcd_transformers/transformers/shared/constants"
	"github.com/vulcanize/mcd_transformers/transformers/storage_diffs/maker/vat"
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
		db          *postgres.DB
		vatRepo     vat.VatStorageRepository
		headerRepo  repositories.HeaderRepository
		fakeUrn     string
		fakeIlk     string
		inkMetadata utils.StorageValueMetadata
		artMetadata utils.StorageValueMetadata
	)

	BeforeEach(func() {
		db = test_config.NewTestDB(test_config.NewTestNode())
		headerRepo = repositories.NewHeaderRepository(db)
		vatRepo = vat.VatStorageRepository{}
		vatRepo.SetDB(db)

		fakeIlk = test_data.RandomString(5)
		fakeUrn = test_data.RandomString(5)
		inkMetadata = utils.GetStorageValueMetadata(vat.UrnInk,
			map[utils.Key]string{constants.Ilk: fakeIlk, constants.Guy: fakeUrn}, utils.Uint256)
		artMetadata = utils.GetStorageValueMetadata(vat.UrnArt,
			map[utils.Key]string{constants.Ilk: fakeIlk, constants.Guy: fakeUrn}, utils.Uint256)
	})

	It("returns a reverse chronological history for the given ilk and urn", func() {
		blockOne := rand.Int()
		timestampOne := rand.Int()
		createFakeHeader(blockOne, timestampOne, headerRepo)

		// Relevant ink diff in block one
		inkOne := strconv.Itoa(rand.Int())
		err := vatRepo.Create(blockOne, "", inkMetadata, inkOne)
		Expect(err).NotTo(HaveOccurred())

		// Irrelevant ink diff in block one
        wrongUrn := test_data.RandomString(5)
        wrongInk := strconv.Itoa(rand.Int())
        wrongMetadata := utils.GetStorageValueMetadata(vat.UrnInk,
            map[utils.Key]string{constants.Ilk: fakeIlk, constants.Guy: wrongUrn}, utils.Uint256)
        err = vatRepo.Create(blockOne, "", wrongMetadata, wrongInk)


		blockTwo := rand.Int()
		timestampTwo := timestampOne + 1
		createFakeHeader(blockTwo, timestampTwo, headerRepo)

		// Relevant art diff in block two
		artOne := strconv.Itoa(rand.Int())
		err = vatRepo.Create(blockTwo, "", artMetadata, artOne)

		// Relevant ink diff in block two
		inkTwo := strconv.Itoa(rand.Int())
		err = vatRepo.Create(blockTwo, "", inkMetadata, inkTwo)

		expectedUrnChanges := []UrnChange{
            {
                Ink:       sql.NullString{String: inkTwo, Valid: true},
                Art:       sql.NullString{Valid: false},
                Timestamp: strconv.Itoa(timestampTwo),
            },
            {
                Ink:       sql.NullString{Valid: false},
                Art:       sql.NullString{String: artOne, Valid: true},
                Timestamp: strconv.Itoa(timestampTwo),
            },
            {
                Ink:       sql.NullString{String: inkOne, Valid: true},
                Art:       sql.NullString{Valid: false},
                Timestamp: strconv.Itoa(timestampOne),
            },
        }

		var result []UrnChange
        dbErr := db.Select(&result, `SELECT * FROM urn_history($1, $2)`, fakeIlk, fakeUrn)
        Expect(dbErr).NotTo(HaveOccurred())
        // Expected made to match postgres ordering. How should we break ties on block/timestamps in the query?
        Expect(result).To(Equal(expectedUrnChanges))
	})
})

type UrnChange struct {
	Ink       sql.NullString
	Art       sql.NullString
	Timestamp string
}

func createFakeHeader(blockNumber, timestamp int, headerRepo repositories.HeaderRepository) {
	fakeHeaderOne := fakes.GetFakeHeader(int64(blockNumber))
	fakeHeaderOne.Timestamp = strconv.Itoa(timestamp)

	_, headerErr := headerRepo.CreateOrUpdateHeader(fakeHeaderOne)
	Expect(headerErr).NotTo(HaveOccurred())
}
