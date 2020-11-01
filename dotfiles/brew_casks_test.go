package dotfiles

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetMissingCasks(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("brew", []string{"cask", "list"}, []byte("bar"), nil)
	b := BrewCasks{
		Packages:  []string{"bar", "foo"},
		Commander: commander.Output,
	}
	missingPackages, err := b.GetMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"foo"}, missingPackages)
}

func TestInstallingCasks(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("brew", []string{"cask", "install", "bar", "foo"}, nil, nil)
	b := BrewCasks{
		Commander: commander.Output,
	}
	err := b.InstallPackages([]string{"bar", "foo"})
	assert.NoError(t, err)
}

func TestTryingToInstallCasksWithEmptyListDoesNotCallBrew(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	b := BrewCasks{
		Commander: commander.Output,
	}
	err := b.InstallPackages([]string{})
	assert.NoError(t, err)
}
