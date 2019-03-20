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

package integration_tests

import (
	"strconv"

	"github.com/ethereum/go-ethereum/common"
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"

	"github.com/vulcanize/mcd_transformers/test_config"
	"github.com/vulcanize/mcd_transformers/transformers/events/vat_frob"
	"github.com/vulcanize/mcd_transformers/transformers/shared"
	"github.com/vulcanize/mcd_transformers/transformers/shared/constants"
	"github.com/vulcanize/mcd_transformers/transformers/test_data"
	c2 "github.com/vulcanize/vulcanizedb/libraries/shared/constants"
	"github.com/vulcanize/vulcanizedb/libraries/shared/factories"
	fetch "github.com/vulcanize/vulcanizedb/libraries/shared/fetcher"
	"github.com/vulcanize/vulcanizedb/libraries/shared/transformer"
	"github.com/vulcanize/vulcanizedb/pkg/core"
	"github.com/vulcanize/vulcanizedb/pkg/datastore/postgres"
)

var _ = Describe("Vat frob Transformer", func() {
	var (
		db          *postgres.DB
		blockChain  core.BlockChain
		fetcher     *fetch.Fetcher
		config      transformer.TransformerConfig
		initializer factories.LogNoteTransformer
	)

	BeforeEach(func() {
		rpcClient, ethClient, err := getClients(ipc)
		Expect(err).NotTo(HaveOccurred())
		blockChain, err = getBlockChain(rpcClient, ethClient)
		Expect(err).NotTo(HaveOccurred())
		db = test_config.NewTestDB(blockChain.Node())
		test_config.CleanTestDB(db)

		fetcher = fetch.NewFetcher(blockChain)
		config = transformer.TransformerConfig{
			TransformerName:     constants.VatFrobLabel,
			ContractAddresses:   []string{test_data.KovanUpdatedVatContractAddress},
			ContractAbi:         test_data.KovanUpdatedVatContractAddress,
			Topic:               test_data.KovanVatFrobSignature,
			StartingBlockNumber: 0,
			EndingBlockNumber:   -1,
		}

		initializer = factories.LogNoteTransformer{
			Config:     config,
			Converter:  &vat_frob.VatFrobConverter{},
			Repository: &vat_frob.VatFrobRepository{},
		}
	})

	It("fetches and transforms a vat frob event from Kovan chain", func() {
		blockNumber := int64(10512592)
		initializer.Config.StartingBlockNumber = blockNumber
		initializer.Config.EndingBlockNumber = blockNumber

		header, err := persistHeader(db, blockNumber, blockChain)
		Expect(err).NotTo(HaveOccurred())

		logs, err := fetcher.FetchLogs(
			transformer.HexStringsToAddresses(config.ContractAddresses),
			[]common.Hash{common.HexToHash(config.Topic)},
			header)
		Expect(err).NotTo(HaveOccurred())

		transformer := initializer.NewLogNoteTransformer(db)
		err = transformer.Execute(logs, header, c2.HeaderMissing)
		Expect(err).NotTo(HaveOccurred())

		var dbResult []vat_frob.VatFrobModel
		err = db.Select(&dbResult, `SELECT ilk, urn, v, w, dink, dart from maker.vat_frob`)
		Expect(err).NotTo(HaveOccurred())

		Expect(len(dbResult)).To(Equal(1))
		ilkID, err := shared.GetOrCreateIlk("4554480000000000000000000000000000000000000000000000000000000000", db)
		Expect(err).NotTo(HaveOccurred())
		Expect(dbResult[0].Ilk).To(Equal(strconv.Itoa(ilkID)))
		Expect(dbResult[0].Urn).To(Equal("da15dce70ab462e66779f23ee14f21d993789ee3000000000000000000000000"))
		Expect(dbResult[0].V).To(Equal("da15dce70ab462e66779f23ee14f21d993789ee3000000000000000000000000"))
		Expect(dbResult[0].W).To(Equal("da15dce70ab462e66779f23ee14f21d993789ee3000000000000000000000000"))
		Expect(dbResult[0].Dink).To(Equal("1000000000000000000"))
		Expect(dbResult[0].Dart).To(Equal("0"))
	})

	It("rechecks vat frob event", func() {
		blockNumber := int64(10529222)
		initializer.Config.StartingBlockNumber = blockNumber
		initializer.Config.EndingBlockNumber = blockNumber

		header, err := persistHeader(db, blockNumber, blockChain)
		Expect(err).NotTo(HaveOccurred())

		logs, err := fetcher.FetchLogs(
			transformer.HexStringsToAddresses(config.ContractAddresses),
			[]common.Hash{common.HexToHash(config.Topic)},
			header)
		Expect(err).NotTo(HaveOccurred())

		transformer := initializer.NewLogNoteTransformer(db)
		err = transformer.Execute(logs, header, c2.HeaderMissing)
		Expect(err).NotTo(HaveOccurred())

		err = transformer.Execute(logs, header, c2.HeaderRecheck)
		Expect(err).NotTo(HaveOccurred())

		var headerID int64
		err = db.Get(&headerID, `SELECT id FROM public.headers WHERE block_number = $1`, blockNumber)
		Expect(err).NotTo(HaveOccurred())

		var vatFrobChecked []int
		err = db.Select(&vatFrobChecked, `SELECT vat_frob_checked FROM public.checked_headers WHERE header_id = $1`, headerID)
		Expect(err).NotTo(HaveOccurred())

		Expect(vatFrobChecked[0]).To(Equal(2))

		var dbResult []vat_frob.VatFrobModel
		err = db.Select(&dbResult, `SELECT ilk, urn, v, w, dink, dart from maker.vat_frob`)
		Expect(err).NotTo(HaveOccurred())

		Expect(len(dbResult)).To(Equal(1))
		ilkID, err := shared.GetOrCreateIlk("5245500000000000000000000000000000000000000000000000000000000000", db)
		Expect(err).NotTo(HaveOccurred())
		Expect(dbResult[0].Ilk).To(Equal(strconv.Itoa(ilkID)))
		Expect(dbResult[0].Urn).To(Equal("16fb96a5fa0427af0c8f7cf1eb4870231c8154b6000000000000000000000000"))
		Expect(dbResult[0].V).To(Equal("16fb96a5fa0427af0c8f7cf1eb4870231c8154b6000000000000000000000000"))
		Expect(dbResult[0].W).To(Equal("16fb96a5fa0427af0c8f7cf1eb4870231c8154b6000000000000000000000000"))
		Expect(dbResult[0].Dink).To(Equal("10000000000000000000"))
		Expect(dbResult[0].Dart).To(Equal("0"))
	})
})