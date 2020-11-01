package dotfiles

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetMissingTaps(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("brew", []string{"tap"}, []byte("bar"), nil)
	b := BrewTaps{
		Packages:  []string{"bar", "foo"},
		Commander: commander.Output,
	}
	missingPackages, err := b.GetMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"foo"}, missingPackages)
}

func TestInstallingTaps(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("brew", []string{"tap", "bar", "foo"}, nil, nil)
	b := BrewTaps{
		Commander: commander.Output,
	}
	err := b.InstallPackages([]string{"bar", "foo"})
	assert.NoError(t, err)
}

func TestTryingToInstallTapsWithEmptyListDoesNotCallBrew(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	b := BrewTaps{
		Commander: commander.Output,
	}
	err := b.InstallPackages([]string{})
	assert.NoError(t, err)
}
