package npm

import (
	"errors"
	"testing"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/stretchr/testify/assert"
)

func TestGetMissingNPMPackage(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	commander.OnOutput("npm", []string{"ls", "--global", "bar"}).Return(nil, nil)
	commander.OnOutput("npm", []string{"ls", "--global", "foo"}).Return(nil, errors.New("some error"))
	b := Plugin{
		Packages:  []string{"bar", "foo"},
		Commander: commander.Output,
	}
	missingPackages, err := b.GetMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"foo"}, missingPackages)
}

func TestInstallingNPMPackage(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	commander.OnOutput("npm", []string{"install", "--global", "bar", "foo"}).Return(nil, nil)
	b := Plugin{
		Commander: commander.Output,
	}
	err := b.Add([]string{"bar", "foo"})
	assert.NoError(t, err)
}

func TestTryingToInstallNPMPackageWithEmptyListDoesNotCallCode(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	b := Plugin{
		Commander: commander.Output,
	}
	err := b.Add([]string{})
	assert.NoError(t, err)
}

func TestUpdatingNPMPackage(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	commander.OnOutput("npm", []string{"update", "--global"}).Return(nil, nil)
	b := Plugin{
		Commander: commander.Output,
	}
	err := b.Update()
	assert.NoError(t, err)
}
