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

package maker

import (
	"database/sql"
	"math/big"

	"github.com/vulcanize/vulcanizedb/pkg/datastore/postgres"
)

type Urn struct {
	Ilk string
	Guy string
}

type IMakerStorageRepository interface {
	GetDaiKeys() ([]string, error)
	GetMaxFlip() (*big.Int, error)
	GetGemKeys() ([]Urn, error)
	GetIlks() ([]string, error)
	GetSinKeys() ([]string, error)
	GetUrns() ([]Urn, error)
	SetDB(db *postgres.DB)
}

type MakerStorageRepository struct {
	db *postgres.DB
}

func (repository *MakerStorageRepository) GetDaiKeys() ([]string, error) {
	var daiKeys []string
	err := repository.db.Select(&daiKeys, `
		SELECT DISTINCT src FROM maker.vat_move UNION
		SELECT DISTINCT dst FROM maker.vat_move UNION
		SELECT DISTINCT w FROM maker.vat_tune UNION
		SELECT DISTINCT v FROM maker.vat_heal UNION
		SELECT DISTINCT urn FROM maker.vat_fold
	`)
	return daiKeys, err
}

func (repository *MakerStorageRepository) GetMaxFlip() (*big.Int, error) {
	var maxFlip big.Int
	err := repository.db.Get(&maxFlip, `SELECT MAX(nflip) FROM maker.cat_nflip`)
	if err == sql.ErrNoRows {
		// No flips have occurred; this is different from flip 0 having occurred
		return nil, nil
	}
	return &maxFlip, err
}

func (repository *MakerStorageRepository) GetGemKeys() ([]Urn, error) {
	var gems []Urn
	err := repository.db.Select(&gems, `
		SELECT DISTINCT ilks.ilk, slip.guy 
		FROM maker.vat_slip slip
		INNER JOIN maker.ilks ilks ON ilks.id = slip.ilk
		UNION
		SELECT DISTINCT ilks.ilk, flux.src AS guy 
		FROM maker.vat_flux flux
		INNER JOIN maker.ilks ilks ON ilks.id = flux.ilk
		UNION
		SELECT DISTINCT ilks.ilk, flux.dst AS guy 
		FROM maker.vat_flux flux
		INNER JOIN maker.ilks ilks ON ilks.id = flux.ilk
		UNION
		SELECT DISTINCT ilks.ilk, tune.v AS guy 
		FROM maker.vat_tune tune
		INNER JOIN maker.ilks ilks ON ilks.id = tune.ilk
		UNION
		SELECT DISTINCT ilks.ilk, grab.v AS guy 
		FROM maker.vat_grab grab
		INNER JOIN maker.ilks ilks ON ilks.id = grab.ilk
		UNION
		SELECT DISTINCT ilks.ilk, toll.urn AS guy 
		FROM maker.vat_toll toll
		INNER JOIN maker.ilks ilks ON ilks.id = toll.ilk
	`)
	return gems, err
}

func (repository MakerStorageRepository) GetIlks() ([]string, error) {
	var ilks []string
	err := repository.db.Select(&ilks, `SELECT DISTINCT ilk FROM maker.ilks`)
	return ilks, err
}

func (repository *MakerStorageRepository) GetSinKeys() ([]string, error) {
	var sinKeys []string
	err := repository.db.Select(&sinKeys, `SELECT DISTINCT w FROM maker.vat_grab UNION
		SELECT DISTINCT urn FROM maker.vat_heal`)
	return sinKeys, err
}

func (repository *MakerStorageRepository) GetUrns() ([]Urn, error) {
	var urns []Urn
	err := repository.db.Select(&urns, `
		SELECT DISTINCT ilks.ilk, tune.urn AS guy
		FROM maker.vat_tune tune
		INNER JOIN maker.ilks ilks ON ilks.id = tune.ilk
		UNION
		SELECT DISTINCT ilks.ilk, grab.urn AS guy
		FROM maker.vat_grab grab
		INNER JOIN maker.ilks ilks ON ilks.id = grab.ilk
`)
	return urns, err
}

func (repository *MakerStorageRepository) SetDB(db *postgres.DB) {
	repository.db = db
}