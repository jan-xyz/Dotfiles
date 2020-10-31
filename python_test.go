package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetMissingPythonPackage(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput(
		"/usr/local/bin/python3",
		[]string{"-m", "pip", "freeze"},
		[]byte("bar==1.0.0"),
		nil,
	)
	p := python{
		packages:  []string{"bar", "foo"},
		commander: commander.Output,
	}
	missing_packages, err := p.getMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"foo"}, missing_packages)
}

func TestInstallingPythonPackage(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput(
		"/usr/local/bin/python3",
		[]string{"-m", "pip", "install", "bar", "foo"},
		nil,
		nil,
	)
	b := python{
		commander: commander.Output,
	}
	err := b.installPackages([]string{"bar", "foo"})
	assert.NoError(t, err)
}
