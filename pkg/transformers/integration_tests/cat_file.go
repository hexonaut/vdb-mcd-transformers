// Copyright 2018 Vulcanize
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package integration_tests

import (
	"sort"

	"github.com/ethereum/go-ethereum/ethclient"
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"

	"github.com/vulcanize/vulcanizedb/pkg/core"
	"github.com/vulcanize/vulcanizedb/pkg/datastore/postgres"
	"github.com/vulcanize/vulcanizedb/pkg/geth/client"
	"github.com/vulcanize/vulcanizedb/pkg/transformers/cat_file"
	"github.com/vulcanize/vulcanizedb/pkg/transformers/cat_file/chop_lump"
	"github.com/vulcanize/vulcanizedb/pkg/transformers/cat_file/flip"
	"github.com/vulcanize/vulcanizedb/pkg/transformers/cat_file/pit_vow"
	"github.com/vulcanize/vulcanizedb/test_config"
)

var _ = Describe("Cat File transformer", func() {
	var (
		db         *postgres.DB
		blockchain core.BlockChain
		rpcClient  client.RpcClient
		err        error
		ethClient  *ethclient.Client
	)

	BeforeEach(func() {
		rpcClient, ethClient, err = getClients(ipc)
		Expect(err).NotTo(HaveOccurred())
		blockchain, err = getBlockChain(rpcClient, ethClient)
		Expect(err).NotTo(HaveOccurred())
		db = test_config.NewTestDB(blockchain.Node())
		test_config.CleanTestDB(db)
	})

	// Cat contract Kovan address: 0x2f34f22a00ee4b7a8f8bbc4eaee1658774c624e0
	It("persists a chop lump event", func() {
		// transaction: 0x98574bfba4d05c3875be10d2376e678d005dbebe9a4520363407508fd21f4014
		chopLumpBlockNumber := int64(8762253)
		err = persistHeader(db, chopLumpBlockNumber)
		Expect(err).NotTo(HaveOccurred())

		config := cat_file.CatFileConfig
		config.StartingBlockNumber = chopLumpBlockNumber
		config.EndingBlockNumber = chopLumpBlockNumber

		initializer := chop_lump.CatFileChopLumpTransformerInitializer{Config: config}
		transformer := initializer.NewCatFileChopLumpTransformer(db, blockchain)
		err := transformer.Execute()
		Expect(err).NotTo(HaveOccurred())

		var dbResult []chop_lump.CatFileChopLumpModel
		err = db.Select(&dbResult, `SELECT ilk, what, data, log_idx FROM maker.cat_file_chop_lump`)
		Expect(err).NotTo(HaveOccurred())

		Expect(len(dbResult)).To(Equal(2))
		sort.Sort(byLogIndexChopLump(dbResult))

		Expect(dbResult[0].Ilk).To(Equal("REP"))
		Expect(dbResult[0].What).To(Equal("lump"))
		Expect(dbResult[0].Data).To(Equal("10000000000000000000000"))
		Expect(dbResult[0].LogIndex).To(Equal(uint(3)))

		Expect(dbResult[1].Ilk).To(Equal("REP"))
		Expect(dbResult[1].What).To(Equal("chop"))
		Expect(dbResult[1].Data).To(Equal("1000000000000000000000000000"))
		Expect(dbResult[1].LogIndex).To(Equal(uint(4)))
	})

	It("persists a flip event", func() {
		// transaction: 0x44bc18fdb1a5a263db114e7879653304db3e19ceb4e4496f21bc0a76c5faccbe
		flipBlockNumber := int64(8751794)
		err = persistHeader(db, flipBlockNumber)
		Expect(err).NotTo(HaveOccurred())

		config := cat_file.CatFileConfig
		config.StartingBlockNumber = flipBlockNumber
		config.EndingBlockNumber = flipBlockNumber

		initializer := flip.CatFileFlipTransformerInitializer{Config: config}
		transformer := initializer.NewCatFileFlipTransformer(db, blockchain)
		err := transformer.Execute()
		Expect(err).NotTo(HaveOccurred())

		var dbResult []flip.CatFileFlipModel
		err = db.Select(&dbResult, `SELECT ilk, what, flip FROM maker.cat_file_flip`)
		Expect(err).NotTo(HaveOccurred())

		Expect(len(dbResult)).To(Equal(1))
		Expect(dbResult[0].Ilk).To(Equal("ETH"))
		Expect(dbResult[0].What).To(Equal("flip"))
		Expect(dbResult[0].Flip).To(Equal("0x32D496Ad866D110060866B7125981C73642cc509"))
	})

	It("persists a pit vow event", func() {
		// transaction: 0x44bc18fdb1a5a263db114e7879653304db3e19ceb4e4496f21bc0a76c5faccbe
		pitVowBlockNumber := int64(8751794)
		err = persistHeader(db, pitVowBlockNumber)
		Expect(err).NotTo(HaveOccurred())

		config := cat_file.CatFileConfig
		config.StartingBlockNumber = pitVowBlockNumber
		config.EndingBlockNumber = pitVowBlockNumber

		initializer := pit_vow.CatFilePitVowTransformerInitializer{Config: config}
		transformer := initializer.NewCatFilePitVowTransformer(db, blockchain)
		err := transformer.Execute()
		Expect(err).NotTo(HaveOccurred())

		var dbResult []pit_vow.CatFilePitVowModel
		err = db.Select(&dbResult, `SELECT what, data, log_idx FROM maker.cat_file_pit_vow`)
		Expect(err).NotTo(HaveOccurred())

		Expect(len(dbResult)).To(Equal(2))
		sort.Sort(byLogIndexPitVow(dbResult))
		Expect(dbResult[0].What).To(Equal("vow"))
		Expect(dbResult[0].Data).To(Equal("0x3728e9777B2a0a611ee0F89e00E01044ce4736d1"))
		Expect(dbResult[0].LogIndex).To(Equal(uint(1)))

		Expect(dbResult[1].What).To(Equal("pit"))
		Expect(dbResult[1].Data).To(Equal("0xE7CF3198787C9A4daAc73371A38f29aAeECED87e"))
		Expect(dbResult[1].LogIndex).To(Equal(uint(2)))
	})
})

type byLogIndexChopLump []chop_lump.CatFileChopLumpModel

func (c byLogIndexChopLump) Len() int           { return len(c) }
func (c byLogIndexChopLump) Less(i, j int) bool { return c[i].LogIndex < c[j].LogIndex }
func (c byLogIndexChopLump) Swap(i, j int)      { c[i], c[j] = c[j], c[i] }

type byLogIndexPitVow []pit_vow.CatFilePitVowModel

func (c byLogIndexPitVow) Len() int           { return len(c) }
func (c byLogIndexPitVow) Less(i, j int) bool { return c[i].LogIndex < c[j].LogIndex }
func (c byLogIndexPitVow) Swap(i, j int)      { c[i], c[j] = c[j], c[i] }
