/*
 *  Copyright 2018 Vulcanize
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

package bite

import (
	"encoding/json"
	"github.com/ethereum/go-ethereum/accounts/abi/bind"
	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/core/types"
	"github.com/vulcanize/vulcanizedb/pkg/geth"
	"github.com/vulcanize/vulcanizedb/pkg/transformers/shared"
)

type Converter interface {
	ToEntity(contractAddress string, contractAbi string, ethLog types.Log) (BiteEntity, error)
	ToModel(flipKick BiteEntity) (BiteModel, error)
}

type BiteConverter struct{}

func (BiteConverter) ToEntity(contractAddress string, contractAbi string, ethLog types.Log) (BiteEntity, error) {
	entity := BiteEntity{}
	address := common.HexToAddress(contractAddress)
	abi, err := geth.ParseAbi(contractAbi)
	if err != nil {
		return entity, err
	}

	contract := bind.NewBoundContract(address, abi, nil, nil, nil)

	err = contract.UnpackLog(&entity, "Bite", ethLog)
	if err != nil {
		return entity, err
	}

	entity.Raw = ethLog
	entity.TransactionIndex = ethLog.TxIndex

	return entity, nil
}
func (converter BiteConverter) ToModel(entity BiteEntity) (BiteModel, error) {

	id := entity.Id.String()
	ilk := entity.Ilk[:]
	lad := entity.Lad[:]
	ink := entity.Ink.String()
	art := entity.Art.String()
	iArt := entity.IArt.String()
	tab := entity.Tab.String()
	flip := entity.Flip.String()
	txIdx := entity.TransactionIndex
	rawLogJson, err := json.Marshal(entity.Raw)
	rawLogString := string(rawLogJson)
	if err != nil {
		return BiteModel{}, err
	}

	return BiteModel{
		Id:               shared.ConvertNilToEmptyString(id),
		Ilk:              ilk,
		Lad:              lad,
		Ink:              shared.ConvertNilToEmptyString(ink),
		Art:              shared.ConvertNilToEmptyString(art),
		IArt:             shared.ConvertNilToEmptyString(iArt),
		Tab:              shared.ConvertNilToEmptyString(tab),
		Flip:             shared.ConvertNilToEmptyString(flip),
		TransactionIndex: txIdx,
		Raw:              rawLogString,
	}, nil
}