package dotfiles

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetMissingVSCodeExtension(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("code", []string{"--list-extensions"}, []byte("bar"), nil)
	b := VSCode{
		Packages:  []string{"bar", "foo"},
		Commander: commander.Output,
	}
	missingPackages, err := b.GetMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"foo"}, missingPackages)
}

func TestInstallingVSCodeExtension(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("code", []string{"--install-extension", "bar"}, nil, nil)
	commander.ExpectOutput("code", []string{"--install-extension", "foo"}, nil, nil)
	b := VSCode{
		Commander: commander.Output,
	}
	err := b.InstallPackages([]string{"bar", "foo"})
	assert.NoError(t, err)
}

func TestTryingToInstallVSCodeExtensionWithEmptyListDoesNotCallCode(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	b := VSCode{
		Commander: commander.Output,
	}
	err := b.InstallPackages([]string{})
	assert.NoError(t, err)
}
