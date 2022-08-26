package brewbottles

import (
	"testing"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/stretchr/testify/assert"
)

func TestGetMissingBrewPackage(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("brew", []string{"list", "--formula"}, []byte("foo"), nil)
	commander.ExpectOutput("brew", []string{"list", "--casks"}, []byte("bar"), nil)
	b := Plugin{
		Bottles:   []string{"bar", "foo", "baz"},
		Commander: commander.Output,
	}
	missingPackages, err := b.GetMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"baz"}, missingPackages)
}

func TestInstallingBrewPackage(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("brew", []string{"install", "bar", "foo"}, nil, nil)
	b := Plugin{
		Commander: commander.Output,
	}
	err := b.Add([]string{"bar", "foo"})
	assert.NoError(t, err)
}

func TestTryingToInstallBrewPackageWithEmptyListDoesNotCallBrew(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	b := Plugin{
		Commander: commander.Output,
	}
	err := b.Add([]string{})
	assert.NoError(t, err)
}
