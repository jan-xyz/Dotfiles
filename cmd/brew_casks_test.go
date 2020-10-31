package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetMissingCasks(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("brew", []string{"cask", "list"}, []byte("bar"), nil)
	b := brewCasks{
		packages:  []string{"bar", "foo"},
		commander: commander.Output,
	}
	missingPackages, err := b.getMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"foo"}, missingPackages)
}

func TestInstallingCasks(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("brew", []string{"cask", "install", "bar", "foo"}, nil, nil)
	b := brewCasks{
		commander: commander.Output,
	}
	err := b.installPackages([]string{"bar", "foo"})
	assert.NoError(t, err)
}

func TestTryingToInstallCasksWithEmptyListDoesNotCallBrew(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	b := brewCasks{
		commander: commander.Output,
	}
	err := b.installPackages([]string{})
	assert.NoError(t, err)
}
