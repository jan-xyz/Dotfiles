package dotfiles

import (
	"errors"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetMissingNPMPackage(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("npm", []string{"ls", "--global", "bar"}, nil, nil)
	commander.ExpectOutput("npm", []string{"ls", "--global", "foo"}, nil, errors.New("some error"))
	b := NPM{
		Packages:  []string{"bar", "foo"},
		Commander: commander.Output,
	}
	missingPackages, err := b.GetMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"foo"}, missingPackages)
}

func TestInstallingNPMPackage(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("npm", []string{"install", "--global", "bar", "foo"}, nil, nil)
	b := NPM{
		Commander: commander.Output,
	}
	err := b.Add([]string{"bar", "foo"})
	assert.NoError(t, err)
}

func TestTryingToInstallNPMPackageWithEmptyListDoesNotCallCode(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	b := NPM{
		Commander: commander.Output,
	}
	err := b.Add([]string{})
	assert.NoError(t, err)
}

func TestUpdatingNPMPackage(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("npm", []string{"update", "--global"}, nil, nil)
	b := NPM{
		Commander: commander.Output,
	}
	err := b.Update()
	assert.NoError(t, err)
}
