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

package integration_tests

import (
	"strconv"

	"github.com/ethereum/go-ethereum/common"
	"github.com/makerdao/vdb-mcd-transformers/test_config"
	"github.com/makerdao/vdb-mcd-transformers/transformers/events/bite"
	"github.com/makerdao/vdb-mcd-transformers/transformers/shared"
	"github.com/makerdao/vdb-mcd-transformers/transformers/shared/constants"
	"github.com/makerdao/vdb-mcd-transformers/transformers/test_data"
	"github.com/makerdao/vulcanizedb/libraries/shared/factories/event"
	"github.com/makerdao/vulcanizedb/libraries/shared/fetcher"
	"github.com/makerdao/vulcanizedb/libraries/shared/transformer"
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
)

var _ = Describe("Bite Transformer", func() {
	biteConfig := transformer.EventTransformerConfig{
		TransformerName:   constants.BiteTable,
		ContractAddresses: []string{test_data.CatAddress()},
		ContractAbi:       constants.CatABI(),
		Topic:             constants.BiteSignature(),
	}

	It("fetches and transforms a Bite event", func() {
		test_config.CleanTestDB(db)
		blockNumber := int64(8997324)
		biteConfig.StartingBlockNumber = blockNumber
		biteConfig.EndingBlockNumber = blockNumber

		header, err := persistHeader(db, blockNumber, blockChain)
		Expect(err).NotTo(HaveOccurred())

		initializer := event.ConfiguredTransformer{
			Config:      biteConfig,
			Transformer: bite.Transformer{},
		}
		transformer := initializer.NewTransformer(db)

		logFetcher := fetcher.NewLogFetcher(blockChain)
		logs, err := logFetcher.FetchLogs(
			[]common.Address{common.HexToAddress(biteConfig.ContractAddresses[0])},
			[]common.Hash{common.HexToHash(biteConfig.Topic)},
			header)
		Expect(err).NotTo(HaveOccurred())

		eventLogs := test_data.CreateLogs(header.Id, logs, db)

		err = transformer.Execute(eventLogs)
		Expect(err).NotTo(HaveOccurred())

		var dbResult []biteModel
		err = db.Select(&dbResult, `SELECT art, ink, flip, tab, urn_id, bid_id from maker.bite`)
		Expect(err).NotTo(HaveOccurred())

		Expect(len(dbResult)).To(Equal(1))
		Expect(dbResult[0].Art).To(Equal("4460522851157616216837"))
		urnID, err := shared.GetOrCreateUrn("0x0A051CD913dFD1820dbf87a9bf62B04A129F88A5",
			"0x4554482d41000000000000000000000000000000000000000000000000000000", db)
		Expect(err).NotTo(HaveOccurred())
		Expect(dbResult[0].Urn).To(Equal(strconv.FormatInt(urnID, 10)))
		Expect(dbResult[0].Ink).To(Equal("50000000000000000000"))
		Expect(dbResult[0].Flip).To(Equal(test_data.EthFlipAddress()))
		Expect(dbResult[0].Tab).To(Equal("4466031366353941646208178591268931635087392443453"))
		Expect(dbResult[0].Id).To(Equal("112"))
	})
})

type biteModel struct {
	Ilk      string
	Urn      string `db:"urn_id"`
	Ink      string
	Art      string
	Tab      string
	Flip     string
	Id       string `db:"bid_id"`
	HeaderID int64
	LogID    int64 `db:"log_id"`
}
