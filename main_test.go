package main

import (
	"bytes"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestWordHash(t *testing.T) {
	assert.Equal(t, "intensional-catfish", WordHash("test"))
}

func TestAsset(t *testing.T) {
	b, err := Asset("static/style.css.gz")
	assert.Nil(t, err)
	contentType, err := GetFileContentTypeReader("statc/style.css.gz", bytes.NewBuffer(b))
	assert.Nil(t, err)
	assert.Equal(t, "text/css", contentType)
}
