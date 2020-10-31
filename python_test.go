package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetMissingPythonPackage(t *testing.T) {
	testCommander := func(command string, args ...string) ([]byte, error) {
		return []byte("bar==1.0.0"), nil
	}
	p := python{
		packages:  []string{"bar", "foo"},
		commander: testCommander,
	}
	missing_packages, err := p.getMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"foo"}, missing_packages)
}
