package queries

import (
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
	"github.com/vulcanize/mcd_transformers/test_config"
	"github.com/vulcanize/mcd_transformers/transformers/component_tests/queries/test_helpers"
	"github.com/vulcanize/mcd_transformers/transformers/events/flap_kick"
	"github.com/vulcanize/mcd_transformers/transformers/test_data"
	"github.com/vulcanize/vulcanizedb/pkg/datastore/postgres"
	"github.com/vulcanize/vulcanizedb/pkg/datastore/postgres/repositories"
	"github.com/vulcanize/vulcanizedb/pkg/fakes"
	"math/rand"
	"strconv"
)

var _ = Describe("Flap computed columns", func() {
	var (
		db              *postgres.DB
		flapKickRepo    flap_kick.FlapKickRepository
		headerRepo      repositories.HeaderRepository
		contractAddress = "flap contract address"

		fakeBidId      = rand.Int()
		blockOne       = rand.Int()
		timestampOne   = int(rand.Int31())
		blockOneHeader = fakes.GetFakeHeaderWithTimestamp(int64(timestampOne), int64(blockOne))
	)

	BeforeEach(func() {
		db = test_config.NewTestDB(test_config.NewTestNode())
		test_config.CleanTestDB(db)
		headerRepo = repositories.NewHeaderRepository(db)
		flapKickRepo = flap_kick.FlapKickRepository{}
		flapKickRepo.SetDB(db)
	})

	AfterEach(func() {
		closeErr := db.Close()
		Expect(closeErr).NotTo(HaveOccurred())
	})

	Describe("flap_bid_events", func() {
		It("returns the bid events for a flap", func() {
			headerId, headerErr := headerRepo.CreateOrUpdateHeader(blockOneHeader)
			Expect(headerErr).NotTo(HaveOccurred())

			flapStorageValues := test_helpers.GetFlapStorageValues(1, fakeBidId)
			test_helpers.CreateFlap(db, blockOneHeader, flapStorageValues, test_helpers.GetFlapMetadatas(strconv.Itoa(fakeBidId)), contractAddress)

			flapKickEvent := test_data.FlapKickModel
			flapKickEvent.ContractAddress = contractAddress
			flapKickEvent.BidId = strconv.Itoa(fakeBidId)
			flapKickErr := flapKickRepo.Create(headerId, []interface{}{flapKickEvent})
			Expect(flapKickErr).NotTo(HaveOccurred())

			expectedBidEvents := test_helpers.BidEvent{
				BidId:     strconv.Itoa(fakeBidId),
				Lot:       flapKickEvent.Lot,
				BidAmount: flapKickEvent.Bid,
				Act:       "kick",
			}
			var actualBidEvents test_helpers.BidEvent
			queryErr := db.Get(&actualBidEvents,
				`SELECT bid_id, bid_amount, lot, act FROM api.flap_bid_events(
    					(SELECT (bid_id, guy, tic, "end", lot, bid, gal, dealt, created, updated)::api.flap 
    					FROM api.all_flaps()))`)
			Expect(queryErr).NotTo(HaveOccurred())
			Expect(actualBidEvents).To(Equal(expectedBidEvents))
		})

		It("does not include bid events for a different flap", func() {
			headerId, headerErr := headerRepo.CreateOrUpdateHeader(blockOneHeader)
			Expect(headerErr).NotTo(HaveOccurred())

			flapStorageValues := test_helpers.GetFlapStorageValues(1, fakeBidId)
			test_helpers.CreateFlap(db, blockOneHeader, flapStorageValues, test_helpers.GetFlapMetadatas(strconv.Itoa(fakeBidId)), contractAddress)

			flapKickEvent := test_data.FlapKickModel
			flapKickEvent.ContractAddress = contractAddress
			flapKickEvent.BidId = strconv.Itoa(fakeBidId)
			flapKickErr := flapKickRepo.Create(headerId, []interface{}{flapKickEvent})
			Expect(flapKickErr).NotTo(HaveOccurred())

			blockTwo := blockOne + 1
			timestampTwo := timestampOne + 111111
			blockTwoHeader := fakes.GetFakeHeaderWithTimestamp(int64(timestampTwo), int64(blockTwo))
			headerTwoId, headerTwoErr := headerRepo.CreateOrUpdateHeader(blockTwoHeader)
			Expect(headerTwoErr).NotTo(HaveOccurred())

			irrelevantBidId := fakeBidId + 9999999999999
			irrelevantFlapStorageValues := test_helpers.GetFlapStorageValues(2, irrelevantBidId)
			test_helpers.CreateFlap(db, blockTwoHeader, irrelevantFlapStorageValues, test_helpers.GetFlapMetadatas(strconv.Itoa(irrelevantBidId)), contractAddress)

			irrelevantFlapKickEvent := test_data.FlapKickModel
			irrelevantFlapKickEvent.ContractAddress = contractAddress
			irrelevantFlapKickEvent.BidId = strconv.Itoa(irrelevantBidId)

			flapKickErr = flapKickRepo.Create(headerTwoId, []interface{}{irrelevantFlapKickEvent})
			Expect(flapKickErr).NotTo(HaveOccurred())

			expectedBidEvents := test_helpers.BidEvent{
				BidId:     strconv.Itoa(fakeBidId),
				Lot:       flapKickEvent.Lot,
				BidAmount: flapKickEvent.Bid,
				Act:       "kick",
			}

			var actualBidEvents []test_helpers.BidEvent
			queryErr := db.Select(&actualBidEvents,
				`SELECT bid_id, bid_amount, lot, act FROM api.flap_bid_events(
    					(SELECT (bid_id, guy, tic, "end", lot, bid, gal, dealt, created, updated)::api.flap
    					FROM api.all_flaps() WHERE bid_id = $1))`, fakeBidId)

			Expect(queryErr).NotTo(HaveOccurred())
			Expect(actualBidEvents).To(ConsistOf(expectedBidEvents))
		})
	})
})