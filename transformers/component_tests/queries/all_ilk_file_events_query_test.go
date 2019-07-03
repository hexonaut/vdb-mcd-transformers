package queries

import (
	"github.com/vulcanize/mcd_transformers/transformers/shared"
	"math/rand"
	"strconv"

	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
	"github.com/vulcanize/vulcanizedb/pkg/datastore"
	"github.com/vulcanize/vulcanizedb/pkg/datastore/postgres"
	"github.com/vulcanize/vulcanizedb/pkg/datastore/postgres/repositories"
	"github.com/vulcanize/vulcanizedb/pkg/fakes"

	"github.com/vulcanize/mcd_transformers/test_config"
	"github.com/vulcanize/mcd_transformers/transformers/component_tests/queries/test_helpers"
	"github.com/vulcanize/mcd_transformers/transformers/events/cat_file/chop_lump"
	"github.com/vulcanize/mcd_transformers/transformers/events/cat_file/flip"
	ilk2 "github.com/vulcanize/mcd_transformers/transformers/events/jug_file/ilk"
	"github.com/vulcanize/mcd_transformers/transformers/events/spot_file/mat"
	"github.com/vulcanize/mcd_transformers/transformers/events/spot_file/pip"
	"github.com/vulcanize/mcd_transformers/transformers/events/vat_file/ilk"
	"github.com/vulcanize/mcd_transformers/transformers/test_data"
)

var _ = Describe("Ilk File Events Query", func() {
	var (
		catFileChopLumpRepo   chop_lump.CatFileChopLumpRepository
		catFileFlipRepo       flip.CatFileFlipRepository
		db                    *postgres.DB
		err                   error
		headerOneId           int64
		headerRepo            datastore.HeaderRepository
		jugFileRepo           ilk2.JugFileIlkRepository
		relevantIlkIdentifier = test_helpers.GetValidNullString(test_helpers.FakeIlk.Identifier)
		spotFileMatRepo       mat.SpotFileMatRepository
		spotFilePipRepo       pip.SpotFilePipRepository
		vatFileRepo           ilk.VatFileIlkRepository
	)

	BeforeEach(func() {
		db = test_config.NewTestDB(test_config.NewTestNode())
		test_config.CleanTestDB(db)
		catFileChopLumpRepo = chop_lump.CatFileChopLumpRepository{}
		catFileChopLumpRepo.SetDB(db)
		catFileFlipRepo = flip.CatFileFlipRepository{}
		catFileFlipRepo.SetDB(db)
		headerRepo = repositories.NewHeaderRepository(db)
		headerOne := fakes.GetFakeHeader(1)
		headerOneId, err = headerRepo.CreateOrUpdateHeader(headerOne)
		Expect(err).NotTo(HaveOccurred())
		jugFileRepo = ilk2.JugFileIlkRepository{}
		jugFileRepo.SetDB(db)
		spotFileMatRepo = mat.SpotFileMatRepository{}
		spotFileMatRepo.SetDB(db)
		spotFilePipRepo = pip.SpotFilePipRepository{}
		spotFilePipRepo.SetDB(db)
		vatFileRepo = ilk.VatFileIlkRepository{}
		vatFileRepo.SetDB(db)
	})

	It("returns all ilk file events for ilk", func() {
		catFileChopLump := test_helpers.CopyModel(test_data.CatFileChopModel)
		catFileChopLump.ForeignKeyToValue["ilk_id"] = test_helpers.FakeIlk.Hex
		chopLumpErr := catFileChopLumpRepo.Create(headerOneId, []shared.InsertionModel{catFileChopLump})
		Expect(chopLumpErr).NotTo(HaveOccurred())

		catFileFlip := test_data.CatFileFlipModel
		catFileFlip.ForeignKeyToValue["ilk_id"] = test_helpers.FakeIlk.Hex
		flipErr := catFileFlipRepo.Create(headerOneId, []shared.InsertionModel{catFileFlip})
		Expect(flipErr).NotTo(HaveOccurred())

		jugFile := test_helpers.CopyModel(test_data.JugFileIlkModel)
		jugFile.ForeignKeyToValue["ilk_id"] = test_helpers.FakeIlk.Hex
		jugErr := jugFileRepo.Create(headerOneId, []shared.InsertionModel{jugFile})
		Expect(jugErr).NotTo(HaveOccurred())

		spotFileMat := test_helpers.CopyModel(test_data.SpotFileMatModel)
		spotFileMat.ForeignKeyToValue["ilk_id"] = test_helpers.FakeIlk.Hex
		spotFileMatErr := spotFileMatRepo.Create(headerOneId, []shared.InsertionModel{spotFileMat})
		Expect(spotFileMatErr).NotTo(HaveOccurred())

		spotFilePip := test_helpers.CopyModel(test_data.SpotFilePipModel)
		spotFilePip.ForeignKeyToValue["ilk_id"] = test_helpers.FakeIlk.Hex
		spotFilePipErr := spotFilePipRepo.Create(headerOneId, []shared.InsertionModel{spotFilePip})
		Expect(spotFilePipErr).NotTo(HaveOccurred())

		vatFile := test_helpers.CopyModel(test_data.VatFileIlkDustModel)
		vatFile.ForeignKeyToValue["ilk_id"] = test_helpers.FakeIlk.Hex
		vatErr := vatFileRepo.Create(headerOneId, []shared.InsertionModel{vatFile})
		Expect(vatErr).NotTo(HaveOccurred())

		var actualFiles []test_helpers.IlkFileEvent
		filesErr := db.Select(&actualFiles, `SELECT ilk_identifier, what, data FROM api.all_ilk_file_events($1)`, test_helpers.FakeIlk.Identifier)
		Expect(filesErr).NotTo(HaveOccurred())

		Expect(actualFiles).To(ConsistOf(
			test_helpers.IlkFileEvent{
				IlkIdentifier: relevantIlkIdentifier,
				What:          catFileChopLump.ColumnToValue["what"].(string),
				Data:          catFileChopLump.ColumnToValue["data"].(string),
			},
			test_helpers.IlkFileEvent{
				IlkIdentifier: relevantIlkIdentifier,
				What:          catFileFlip.ColumnToValue["what"].(string),
				Data:          catFileFlip.ColumnToValue["flip"].(string),
			},
			test_helpers.IlkFileEvent{
				IlkIdentifier: relevantIlkIdentifier,
				What:          jugFile.ColumnToValue["what"].(string),
				Data:          jugFile.ColumnToValue["data"].(string),
			},
			test_helpers.IlkFileEvent{
				IlkIdentifier: relevantIlkIdentifier,
				What:          spotFileMat.ColumnToValue["what"].(string),
				Data:          spotFileMat.ColumnToValue["data"].(string),
			},
			test_helpers.IlkFileEvent{
				IlkIdentifier: relevantIlkIdentifier,
				What:          "pip",
				Data:          spotFilePip.ColumnToValue["pip"].(string),
			},
			test_helpers.IlkFileEvent{
				IlkIdentifier: relevantIlkIdentifier,
				What:          vatFile.ColumnToValue["what"].(string),
				Data:          vatFile.ColumnToValue["data"].(string),
			},
		))
	})

	It("includes results across blocks", func() {
		fileBlockOne := test_helpers.CopyModel(test_data.VatFileIlkDustModel)
		fileBlockOne.ForeignKeyToValue["ilk_id"] = test_helpers.FakeIlk.Hex
		fileBlockOne.ColumnToValue["data"] = strconv.Itoa(rand.Int())
		fileBlockOneErr := vatFileRepo.Create(headerOneId, []shared.InsertionModel{fileBlockOne})
		Expect(fileBlockOneErr).NotTo(HaveOccurred())

		headerTwo := fakes.GetFakeHeader(2)
		headerTwo.Hash = "anotherHash"
		headerTwoId, headerTwoErr := headerRepo.CreateOrUpdateHeader(headerTwo)
		Expect(headerTwoErr).NotTo(HaveOccurred())

		fileBlockTwo := test_helpers.CopyModel(test_data.VatFileIlkDustModel)
		fileBlockTwo.ForeignKeyToValue["ilk_id"] = test_helpers.FakeIlk.Hex

		fileBlockTwo.ColumnToValue["data"] = strconv.Itoa(rand.Int())
		fileBlockTwoErr := vatFileRepo.Create(headerTwoId, []shared.InsertionModel{fileBlockTwo})
		Expect(fileBlockTwoErr).NotTo(HaveOccurred())

		var actualFiles []test_helpers.IlkFileEvent
		filesErr := db.Select(&actualFiles, `SELECT ilk_identifier, what, data FROM api.all_ilk_file_events($1)`, test_helpers.FakeIlk.Identifier)
		Expect(filesErr).NotTo(HaveOccurred())

		Expect(actualFiles).To(ConsistOf(
			test_helpers.IlkFileEvent{
				IlkIdentifier: relevantIlkIdentifier,
				What:          fileBlockOne.ColumnToValue["what"].(string),
				Data:          fileBlockOne.ColumnToValue["data"].(string),
			},
			test_helpers.IlkFileEvent{
				IlkIdentifier: relevantIlkIdentifier,
				What:          fileBlockTwo.ColumnToValue["what"].(string),
				Data:          fileBlockTwo.ColumnToValue["data"].(string),
			},
		))
	})

	It("does not include ilk file events for a different ilk", func() {
		relevantFile := test_helpers.CopyModel(test_data.VatFileIlkDustModel)
		relevantFile.ForeignKeyToValue["ilk_id"] = test_helpers.FakeIlk.Hex
		relevantFile.ColumnToValue["data"] = strconv.Itoa(rand.Int())

		irrelevantFile := test_helpers.CopyModel(test_data.VatFileIlkDustModel)
		irrelevantFile.ForeignKeyToValue["ilk_id"] = test_helpers.AnotherFakeIlk.Hex
		irrelevantFile.ColumnToValue["data"] = strconv.Itoa(rand.Int())
		irrelevantFile.ColumnToValue["tx_idx"] = test_data.VatFileIlkDustModel.ColumnToValue["tx_idx"].(uint) + 1

		models := []shared.InsertionModel{relevantFile, irrelevantFile}
		vatBlockOneErr := vatFileRepo.Create(headerOneId, models)
		Expect(vatBlockOneErr).NotTo(HaveOccurred())

		var actualFiles []test_helpers.IlkFileEvent
		filesErr := db.Select(&actualFiles, `SELECT ilk_identifier, what, data FROM api.all_ilk_file_events($1)`, test_helpers.FakeIlk.Identifier)
		Expect(filesErr).NotTo(HaveOccurred())

		Expect(actualFiles).To(ConsistOf(
			test_helpers.IlkFileEvent{
				IlkIdentifier: relevantIlkIdentifier,
				What:          relevantFile.ColumnToValue["what"].(string),
				Data:          relevantFile.ColumnToValue["data"].(string),
			},
		))
	})

	It("fails if no argument is supplied (STRICT)", func() {
		_, err := db.Exec(`SELECT * FROM api.all_ilk_file_events()`)
		Expect(err).NotTo(BeNil())
		Expect(err.Error()).To(ContainSubstring("function api.all_ilk_file_events() does not exist"))
	})
})
