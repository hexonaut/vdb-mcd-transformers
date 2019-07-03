package vat_grab

import (
	repo "github.com/vulcanize/vulcanizedb/libraries/shared/repository"
	"github.com/vulcanize/vulcanizedb/pkg/datastore/postgres"

	"github.com/vulcanize/mcd_transformers/transformers/shared"
	"github.com/vulcanize/mcd_transformers/transformers/shared/constants"
)

type VatGrabRepository struct {
	db *postgres.DB
}

func (repository VatGrabRepository) Create(headerID int64, models []shared.InsertionModel) error {
	return shared.Create(headerID, models, repository.db)
}

func (repository VatGrabRepository) MarkHeaderChecked(headerID int64) error {
	return repo.MarkHeaderChecked(headerID, repository.db, constants.VatGrabChecked)
}

func (repository *VatGrabRepository) SetDB(db *postgres.DB) {
	repository.db = db
}
