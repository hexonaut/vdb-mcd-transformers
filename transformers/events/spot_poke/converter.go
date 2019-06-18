//  VulcanizeDB
//  Copyright © 2019 Vulcanize
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Affero General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Affero General Public License for more details.
//
//  You should have received a copy of the GNU Affero General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.

package spot_poke

import (
	"encoding/json"
	"fmt"
	"github.com/ethereum/go-ethereum/accounts/abi/bind"
	"github.com/ethereum/go-ethereum/core/types"
	"github.com/vulcanize/mcd_transformers/transformers/shared"
	"github.com/vulcanize/vulcanizedb/pkg/geth"
	"math/big"
)

type SpotPokeConverter struct{}

func (s SpotPokeConverter) ToEntities(contractAbi string, ethLogs []types.Log) ([]interface{}, error) {
	var entities []interface{}
	for _, ethLog := range ethLogs {
		entity := &SpotPokeEntity{}
		address := ethLog.Address
		abi, err := geth.ParseAbi(contractAbi)
		if err != nil {
			return nil, err
		}

		contract := bind.NewBoundContract(address, abi, nil, nil, nil)

		err = contract.UnpackLog(entity, "Poke", ethLog)
		if err != nil {
			return nil, err
		}

		entity.LogIndex = ethLog.Index
		entity.TransactionIndex = ethLog.TxIndex
		entity.Raw = ethLog
		entities = append(entities, *entity)
	}

	return entities, nil
}

func (s SpotPokeConverter) ToModels(entities []interface{}) ([]interface{}, error) {
	var models []interface{}
	for _, entity := range entities {
		spotPokeEntity, ok := entity.(SpotPokeEntity)
		if !ok {
			return nil, fmt.Errorf("entity of type %T, not %T", entity, SpotPokeEntity{})
		}

		rawLog, err := json.Marshal(spotPokeEntity.Raw)
		if err != nil {
			return nil, err
		}
		spotPokeModel := SpotPokeModel{
			Ilk:              shared.GetHexWithoutPrefix(spotPokeEntity.Ilk[:]),
			Value:            bytesToFloatString(spotPokeEntity.Val[:], 6),
			Spot:             shared.BigIntToString(spotPokeEntity.Spot),
			LogIndex:         spotPokeEntity.LogIndex,
			TransactionIndex: spotPokeEntity.TransactionIndex,
			Raw:              rawLog,
		}
		models = append(models, spotPokeModel)
	}

	return models, nil
}

func bytesToFloatString(bytes []byte, precision int) string {
	bigInt := new(big.Int).SetBytes(bytes)
	bigFloat := new(big.Float).SetInt(bigInt)
	return bigFloat.Text('f', precision)
}