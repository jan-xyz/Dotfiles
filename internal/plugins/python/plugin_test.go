package python

import (
	"testing"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/stretchr/testify/assert"
)

func TestGetMissingPythonPackage(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput(
		"/usr/local/bin/python3",
		[]string{"-m", "pip", "freeze"},
		[]byte("bar==1.0.0"),
		nil,
	)
	p := Python{
		Packages:  []string{"bar", "foo"},
		Commander: commander.Output,
	}
	missingPackages, err := p.GetMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"foo"}, missingPackages)
}

func TestInstallingPythonPackage(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput(
		"/usr/local/bin/python3",
		[]string{"-m", "pip", "install", "bar", "foo"},
		nil,
		nil,
	)
	b := Python{
		Commander: commander.Output,
	}
	err := b.Add([]string{"bar", "foo"})
	assert.NoError(t, err)
}

func TestTryingToInstallPythonPackageWithEmptyListDoesNotCallBrew(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	p := Python{
		Commander: commander.Output,
	}
	err := p.Add([]string{})
	assert.NoError(t, err)
}

func TestUpdatingPythonPackage(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput(
		"/usr/local/bin/python3",
		[]string{"-m", "pip", "install", "--upgrade", "bar", "foo"},
		nil,
		nil,
	)
	b := Python{
		Packages:  []string{"bar", "foo"},
		Commander: commander.Output,
	}
	err := b.Update()
	assert.NoError(t, err)
}
