package test_data

import (
	"bytes"
	"encoding/gob"
	. "github.com/onsi/gomega"
	"github.com/vulcanize/mcd_transformers/transformers/shared"
)

// Returns a deep copy of the given model, so tests aren't getting the same map/slice references
func CopyModel(model shared.InsertionModel) shared.InsertionModel {
	buf := new(bytes.Buffer)
	encoder := gob.NewEncoder(buf)
	encErr := encoder.Encode(model)
	Expect(encErr).NotTo(HaveOccurred())

	var newModel shared.InsertionModel
	decoder := gob.NewDecoder(buf)
	decErr := decoder.Decode(&newModel)
	Expect(decErr).NotTo(HaveOccurred())
	return newModel
}
