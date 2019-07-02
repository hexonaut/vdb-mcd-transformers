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

package test_data

import (
	"encoding/json"
	"github.com/vulcanize/mcd_transformers/transformers/shared"

	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/common/hexutil"
	"github.com/ethereum/go-ethereum/core/types"
	"github.com/vulcanize/vulcanizedb/pkg/fakes"

	"github.com/vulcanize/mcd_transformers/transformers/shared/constants"
)

var DealLogNote = types.Log{
	Address: common.HexToAddress(constants.OldFlipperContractAddress()),
	Topics: []common.Hash{
		common.HexToHash(constants.DealSignature()),
		common.HexToHash("0x00000000000000000000000064d922894153be9eef7b7218dc565d1d0ce2a092"),
		common.HexToHash("0x000000000000000000000000000000000000000000000000000000000000007b"),
		common.HexToHash("0x0000000000000000000000000000000000000000000000000000000000000000"),
	},
	Data:        hexutil.MustDecode("0x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000024c959c42b000000000000000000000000000000000000000000000000000000000000007b"),
	BlockNumber: 16,
	TxHash:      common.HexToHash("0xc6ff19de9299e5b290ba2d52fdb4662360ca86376613d78ee546244866a0be2d"),
	TxIndex:     74,
	BlockHash:   fakes.FakeHash,
	Index:       75,
	Removed:     false,
}
var dealRawJson, _ = json.Marshal(DealLogNote)

var DealModel = shared.InsertionModel{
	TableName: "deal",
	OrderedColumns: []string{
		"header_id", "bid_id", "contract_address", "log_idx", "tx_idx", "raw_log",
	},
	ColumnToValue: map[string]interface{}{
		"bid_id":           "123",
		"contract_address": constants.OldFlipperContractAddress(),
		"log_idx":          DealLogNote.Index,
		"tx_idx":           DealLogNote.TxIndex,
		"raw_log":          dealRawJson,
	},
	ForeignKeyToValue: map[string]string{},
}
