package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetMissingTaps(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("brew", []string{"tap"}, []byte("bar"), nil)
	b := brewTaps{
		packages:  []string{"bar", "foo"},
		commander: commander.Output,
	}
	missingPackages, err := b.getMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"foo"}, missingPackages)
}

func TestInstallingTaps(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("brew", []string{"tap", "bar", "foo"}, nil, nil)
	b := brewTaps{
		commander: commander.Output,
	}
	err := b.installPackages([]string{"bar", "foo"})
	assert.NoError(t, err)
}

func TestTryingToInstallTapsWithEmptyListDoesNotCallBrew(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	b := brewTaps{
		commander: commander.Output,
	}
	err := b.installPackages([]string{})
	assert.NoError(t, err)
}
