package vat

import (
	"strconv"

	"github.com/ethereum/go-ethereum/common"
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
	"github.com/vulcanize/vulcanizedb/libraries/shared/factories/storage"
	"github.com/vulcanize/vulcanizedb/libraries/shared/storage/utils"
	"github.com/vulcanize/vulcanizedb/pkg/datastore/postgres"
	"github.com/vulcanize/vulcanizedb/pkg/datastore/postgres/repositories"
	"github.com/vulcanize/vulcanizedb/pkg/fakes"

	"github.com/vulcanize/mcd_transformers/test_config"
	"github.com/vulcanize/mcd_transformers/transformers/events/vat_frob"
	"github.com/vulcanize/mcd_transformers/transformers/shared"
	storage2 "github.com/vulcanize/mcd_transformers/transformers/storage"
	"github.com/vulcanize/mcd_transformers/transformers/storage/test_helpers"
	"github.com/vulcanize/mcd_transformers/transformers/storage/vat"
	"github.com/vulcanize/mcd_transformers/transformers/test_data"
)

var _ = Describe("Executing the transformer", func() {
	var (
		db *postgres.DB

		mappings    = vat.VatMappings{StorageRepository: &storage2.MakerStorageRepository{}}
		repository  = vat.VatStorageRepository{}
		transformer = storage.Transformer{
			Address:    common.Address{},
			Mappings:   &mappings,
			Repository: &repository,
		}
	)

	BeforeEach(func() {
		db = test_config.NewTestDB(test_config.NewTestNode())
		test_config.CleanTestDB(db)
		transformer.NewTransformer(db)
	})

	It("reads in a Vat debt storage diff row and persists it", func() {
		blockNumber := 10616394
		blockHash := "0xd10b838e10cc3c6f30df25bf25beb1a94cb5d4d4752c795f3e8f5ee8aecbb37c"
		vatDebtRow := utils.StorageDiffRow{
			Contract:     common.HexToAddress("48f749bd988caafacd7b951abbecc1aa31488690"),
			BlockHeight:  blockNumber,
			BlockHash:    common.HexToHash(blockHash[2:]),
			StorageKey:   common.HexToHash("0000000000000000000000000000000000000000000000000000000000000007"),
			StorageValue: common.HexToHash("00000000000000000000000000047bf19673df52e37f2410011d100000000000"),
		}
		err := transformer.Execute(vatDebtRow)
		Expect(err).NotTo(HaveOccurred())

		var debtResult test_helpers.VariableRes
		err = db.Get(&debtResult, `SELECT block_number, block_hash, debt AS value FROM maker.vat_debt`)
		Expect(err).NotTo(HaveOccurred())
		test_helpers.AssertVariable(debtResult, blockNumber, blockHash, "100000000000000000000000000000000000000000000")
	})

	It("reads in a Vat Line storage diff row and persists it", func() {
		blockNumber := 10590469
		blockHash := "0x29ff622ea764035385c003fc1587a39fd38937c673f732651f8caaee0244c0f0"
		vatLineRow := utils.StorageDiffRow{
			Contract:     common.HexToAddress("48f749bd988caafacd7b951abbecc1aa31488690"),
			BlockHeight:  blockNumber,
			BlockHash:    common.HexToHash(blockHash[2:]),
			StorageKey:   common.HexToHash("0000000000000000000000000000000000000000000000000000000000000009"),
			StorageValue: common.HexToHash("0000000000000000000002ac3a4edbbfb8014e3ba83411e915e8000000000000"),
		}
		err := transformer.Execute(vatLineRow)
		Expect(err).NotTo(HaveOccurred())

		var lineResult test_helpers.VariableRes
		err = db.Get(&lineResult, `SELECT block_number, block_hash, line AS value FROM maker.vat_line`)
		Expect(err).NotTo(HaveOccurred())
		test_helpers.AssertVariable(lineResult, blockNumber, blockHash, "1000000000000000000000000000000000000000000000000000")
	})

	It("reads in a Vat live storage diff row and persists it", func() {
		blockNumber := 10501122
		vatLiveRow := utils.StorageDiffRow{
			Contract:     common.HexToAddress("67fd6c3575fc2dbe2cb596bd3bebc9edb5571fa1"),
			BlockHeight:  blockNumber,
			BlockHash:    common.HexToHash("1622e1531ade0154465dd99a9d25e3b4e4b8b9338edae51b71961446158f177b"),
			StorageKey:   common.HexToHash("000000000000000000000000000000000000000000000000000000000000000a"),
			StorageValue: common.HexToHash("0000000000000000000000000000000000000000000000000000000000000001"),
		}
		err := transformer.Execute(vatLiveRow)
		Expect(err).NotTo(HaveOccurred())

		var liveResult test_helpers.VariableRes
		err = db.Get(&liveResult, `SELECT block_number, block_hash, live AS value FROM maker.vat_live`)
		Expect(err).NotTo(HaveOccurred())
		test_helpers.AssertVariable(liveResult, blockNumber, "0x1622e1531ade0154465dd99a9d25e3b4e4b8b9338edae51b71961446158f177b", "1")
	})

	Describe("ilk", func() {
		var (
			ilkId  int
			ilkErr error
		)

		BeforeEach(func() {
			ilk := "0x4554482d41000000000000000000000000000000000000000000000000000000"
			ilkId, ilkErr = shared.GetOrCreateIlk(ilk, db)
			Expect(ilkErr).NotTo(HaveOccurred())
		})

		It("reads in a Vat ilk Art storage diff row and persists it", func() {
			blockNumber := 10616678
			blockHash := "0xdde583e958e23ef32e7074a47d9610b074cabbbe764bb6f251143e8c6e7a43b1"
			ilkArtRow := utils.StorageDiffRow{
				Contract:     common.HexToAddress("48f749bd988caafacd7b951abbecc1aa31488690"),
				BlockHeight:  blockNumber,
				BlockHash:    common.HexToHash(blockHash[2:]),
				StorageKey:   common.HexToHash("5cd43a2b0a7e767504a508ed07c6f6d26130368a2a5ce573193b4c24eba603bb"),
				StorageValue: common.HexToHash("0000000000000000000000000000000000000000000000000de0b6b3a7640000"),
			}
			err := transformer.Execute(ilkArtRow)
			Expect(err).NotTo(HaveOccurred())

			var artResult test_helpers.MappingRes
			err = db.Get(&artResult, `SELECT block_number, block_hash, ilk_id AS key, art AS value FROM maker.vat_ilk_art`)
			Expect(err).NotTo(HaveOccurred())
			test_helpers.AssertMapping(artResult, blockNumber, blockHash, strconv.Itoa(ilkId), "1000000000000000000")
		})

		It("reads in a Vat ilk rate storage diff row and persists it", func() {
			blockNumber := 10590340
			blockHash := "0xe922c1abedf4f253ba83f3bd3a4fb044955b0919c483781895e99c60cfc193c7"
			ilkRateRow := utils.StorageDiffRow{
				Contract:     common.HexToAddress("48f749bd988caafacd7b951abbecc1aa31488690"),
				BlockHeight:  blockNumber,
				BlockHash:    common.HexToHash(blockHash[2:]),
				StorageKey:   common.HexToHash("5cd43a2b0a7e767504a508ed07c6f6d26130368a2a5ce573193b4c24eba603bc"),
				StorageValue: common.HexToHash("0000000000000000000000000000000000000000033b2e3c9fd0803ce8000000"),
			}
			err := transformer.Execute(ilkRateRow)
			Expect(err).NotTo(HaveOccurred())

			var rateResult test_helpers.MappingRes
			err = db.Get(&rateResult, `SELECT block_number, block_hash, ilk_id AS key, rate AS value FROM maker.vat_ilk_rate`)
			Expect(err).NotTo(HaveOccurred())
			test_helpers.AssertMapping(rateResult, blockNumber, blockHash, strconv.Itoa(ilkId), "1000000000000000000000000000")
		})

		It("reads in a Vat ilk spot storage diff row and persists it", func() {
			blockNumber := 10590525
			blockHash := "0xf855d1467a1881418ab0739b63fdf91ad08d352e9683ad199338dbe430ec6b0c"
			ilkSpotRow := utils.StorageDiffRow{
				Contract:     common.HexToAddress("48f749bd988caafacd7b951abbecc1aa31488690"),
				BlockHeight:  blockNumber,
				BlockHash:    common.HexToHash(blockHash[2:]),
				StorageKey:   common.HexToHash("5cd43a2b0a7e767504a508ed07c6f6d26130368a2a5ce573193b4c24eba603bd"),
				StorageValue: common.HexToHash("0000000000000000000000000000000000000001215a061b4dc8dbb48e000000"),
			}
			err := transformer.Execute(ilkSpotRow)
			Expect(err).NotTo(HaveOccurred())

			var spotResult test_helpers.MappingRes
			err = db.Get(&spotResult, `SELECT block_number, block_hash, ilk_id AS key, spot AS value FROM maker.vat_ilk_spot`)
			Expect(err).NotTo(HaveOccurred())
			test_helpers.AssertMapping(spotResult, blockNumber, blockHash, strconv.Itoa(ilkId), "89550000000000000000000000000")
		})

		It("reads in a Vat ilk line storage diff row and persists it", func() {
			blockNumber := 10616268
			blockHash := "0xdbd54f92401ed20cb3d9ba192c451b2357c9f6052b765891813f7438cb706744"
			ilkLineRow := utils.StorageDiffRow{
				Contract:     common.HexToAddress("48f749bd988caafacd7b951abbecc1aa31488690"),
				BlockHeight:  blockNumber,
				BlockHash:    common.HexToHash(blockHash[2:]),
				StorageKey:   common.HexToHash("5cd43a2b0a7e767504a508ed07c6f6d26130368a2a5ce573193b4c24eba603be"),
				StorageValue: common.HexToHash("00000000000000000000000000047bf19673df52e37f2410011d100000000000"),
			}
			err := transformer.Execute(ilkLineRow)
			Expect(err).NotTo(HaveOccurred())

			var lineResult test_helpers.MappingRes
			err = db.Get(&lineResult, `SELECT block_number, block_hash, ilk_id AS key, line AS value FROM maker.vat_ilk_line`)
			Expect(err).NotTo(HaveOccurred())
			test_helpers.AssertMapping(lineResult, blockNumber, blockHash, strconv.Itoa(ilkId), "100000000000000000000000000000000000000000000")
		})
	})

	Describe("urn", func() {
		var (
			urnID  int
			urnErr error
		)

		BeforeEach(func() {
			ilk := "0x434f4c312d410000000000000000000000000000000000000000000000000000"
			urn := "0x118D6a283f9044Ce17b95226822e5c73F50e0B90"
			urnID, urnErr = shared.GetOrCreateUrn(urn, ilk, db)
			Expect(urnErr).NotTo(HaveOccurred())
		})

		It("reads in a Vat urn ink storage diff row and persists it", func() {
			blockNumber := 10953378
			blockHash := "0x9f88e10734cafabe8e68647e554f74fcb4ce304732072c3ddad1896cae1345eb"
			urnInkRow := utils.StorageDiffRow{
				Contract:     common.HexToAddress("40c55ac74d2f43a0d9ea0709428629cfae21419c"),
				BlockHeight:  blockNumber,
				BlockHash:    common.HexToHash(blockHash[2:]),
				StorageKey:   common.HexToHash("f61b39a22cef8e61a5dc6836ca1a1d267a584ca41782d5b2832fb973dc4731e7"),
				StorageValue: common.HexToHash("000000000000000000000000000000000000000000000002b5e3af16b1880000"),
			}
			err := transformer.Execute(urnInkRow)
			Expect(err).NotTo(HaveOccurred())

			var inkResult test_helpers.MappingRes
			err = db.Get(&inkResult, `SELECT block_number, block_hash, urn_id AS key, ink AS value FROM maker.vat_urn_ink`)
			Expect(err).NotTo(HaveOccurred())
			test_helpers.AssertMapping(inkResult, blockNumber, blockHash, strconv.Itoa(urnID), "50000000000000000000")
		})

		It("reads in a Vat urn art storage diff row and persists it", func() {
			blockNumber := 10953378
			blockHash := "0x9f88e10734cafabe8e68647e554f74fcb4ce304732072c3ddad1896cae1345eb"
			urnInkRow := utils.StorageDiffRow{
				Contract:     common.HexToAddress("40c55ac74d2f43a0d9ea0709428629cfae21419c"),
				BlockHeight:  blockNumber,
				BlockHash:    common.HexToHash(blockHash[2:]),
				StorageKey:   common.HexToHash("f61b39a22cef8e61a5dc6836ca1a1d267a584ca41782d5b2832fb973dc4731e8"),
				StorageValue: common.HexToHash("0000000000000000000000000000000000000000000000000de0b6b3a7640000"),
			}
			err := transformer.Execute(urnInkRow)
			Expect(err).NotTo(HaveOccurred())

			var artResult test_helpers.MappingRes
			err = db.Get(&artResult, `SELECT block_number, block_hash, urn_id AS key, art AS value FROM maker.vat_urn_art`)
			Expect(err).NotTo(HaveOccurred())
			test_helpers.AssertMapping(artResult, blockNumber, blockHash, strconv.Itoa(urnID), "1000000000000000000")
		})
	})

	Describe("gem", func() {
		var (
			guy = "0x118D6a283f9044Ce17b95226822e5c73F50e0B90"
			ilk = "0x434f4c312d410000000000000000000000000000000000000000000000000000"
		)

		BeforeEach(func() {
			headerRepository := repositories.NewHeaderRepository(db)
			headerID, err := headerRepository.CreateOrUpdateHeader(fakes.FakeHeader)
			Expect(err).NotTo(HaveOccurred())
			vatFrobRepository := vat_frob.VatFrobRepository{}
			vatFrobRepository.SetDB(db)
			vatFrob := test_data.VatFrobModelWithPositiveDart
			vatFrob.Ilk = ilk
			vatFrob.V = guy
			insertErr := vatFrobRepository.Create(headerID, []interface{}{vatFrob})
			Expect(insertErr).NotTo(HaveOccurred())
		})

		It("reads in a Vat gem storage diff row and persists it", func() {
			blockNumber := 10953378
			blockHash := "0x9f88e10734cafabe8e68647e554f74fcb4ce304732072c3ddad1896cae1345eb"
			urnInkRow := utils.StorageDiffRow{
				Contract:     common.HexToAddress("40c55ac74d2f43a0d9ea0709428629cfae21419c"),
				BlockHeight:  blockNumber,
				BlockHash:    common.HexToHash(blockHash[2:]),
				StorageKey:   common.HexToHash("f4cd303dafe86407ce2225d1c13f4a50accf4db0b5187d7cf268acff9841cfa4"),
				StorageValue: common.HexToHash("0000000000000000000000000000000000000000000000000000000000000000"),
			}
			err := transformer.Execute(urnInkRow)
			Expect(err).NotTo(HaveOccurred())

			var gemResult test_helpers.DoubleMappingRes
			err = db.Get(&gemResult, `SELECT block_number, block_hash, ilk_id AS key_one, guy AS key_two, gem AS value FROM maker.vat_gem`)
			Expect(err).NotTo(HaveOccurred())
			ilkID, ilkErr := shared.GetOrCreateIlk(ilk, db)
			Expect(ilkErr).NotTo(HaveOccurred())
			test_helpers.AssertDoubleMapping(gemResult, blockNumber, blockHash, strconv.Itoa(ilkID), guy, "0")
		})
	})

	Describe("dai", func() {
		var (
			guy = "0x118D6a283f9044Ce17b95226822e5c73F50e0B90"
		)

		BeforeEach(func() {
			headerRepository := repositories.NewHeaderRepository(db)
			headerID, err := headerRepository.CreateOrUpdateHeader(fakes.FakeHeader)
			Expect(err).NotTo(HaveOccurred())
			vatFrobRepository := vat_frob.VatFrobRepository{}
			vatFrobRepository.SetDB(db)
			vatFrob := test_data.VatFrobModelWithPositiveDart
			vatFrob.W = guy
			insertErr := vatFrobRepository.Create(headerID, []interface{}{vatFrob})
			Expect(insertErr).NotTo(HaveOccurred())
		})

		It("reads in a Vat dai storage diff row and persists it", func() {
			blockNumber := 10953378
			blockHash := "0x9f88e10734cafabe8e68647e554f74fcb4ce304732072c3ddad1896cae1345eb"
			urnInkRow := utils.StorageDiffRow{
				Contract:     common.HexToAddress("40c55ac74d2f43a0d9ea0709428629cfae21419c"),
				BlockHeight:  blockNumber,
				BlockHash:    common.HexToHash(blockHash[2:]),
				StorageKey:   common.HexToHash("de69de809d681089810c52d4e65d3489177732d304a5eda082bcf61b015d3918"),
				StorageValue: common.HexToHash("0000000000000000000000000000000000000000000000000000000000000000"),
			}
			err := transformer.Execute(urnInkRow)
			Expect(err).NotTo(HaveOccurred())

			var daiResult test_helpers.MappingRes
			err = db.Get(&daiResult, `SELECT block_number, block_hash, guy AS key, dai AS value FROM maker.vat_dai`)
			Expect(err).NotTo(HaveOccurred())
			test_helpers.AssertMapping(daiResult, blockNumber, blockHash, guy, "0")
		})
	})
})
