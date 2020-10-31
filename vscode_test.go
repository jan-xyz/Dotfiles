package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetMissingVSCodeExtension(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("code", []string{"--list-extensions"}, []byte("bar"), nil)
	b := vscode{
		packages:  []string{"bar", "foo"},
		commander: commander.Output,
	}
	missingPackages, err := b.getMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"foo"}, missingPackages)
}

func TestInstallingVSCodeExtension(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("code", []string{"--install-extension", "bar"}, nil, nil)
	commander.ExpectOutput("code", []string{"--install-extension", "foo"}, nil, nil)
	b := vscode{
		commander: commander.Output,
	}
	err := b.installPackages([]string{"bar", "foo"})
	assert.NoError(t, err)
}

func TestTryingToInstallVSCodeExtensionWithEmptyListDoesNotCallCode(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	b := vscode{
		commander: commander.Output,
	}
	err := b.installPackages([]string{})
	assert.NoError(t, err)
}
