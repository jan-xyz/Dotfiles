package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetMissingBrewPackage(t *testing.T) {
	testCommander := func(command string, args ...string) ([]byte, error) {
		return []byte("bar"), nil
	}
	b := brew{
		packages:  []string{"bar", "foo"},
		commander: testCommander,
	}
	missing_packages, err := b.getMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"foo"}, missing_packages)
}
