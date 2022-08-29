package golang

import (
	"errors"
	"testing"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/stretchr/testify/assert"
)

func TestGetMissingGoModules(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("command", []string{"-v", "bar"}, nil, nil)
	commander.ExpectOutput("command", []string{"-v", "foo"}, nil, errors.New("some-error"))
	b := Plugin{
		Modules: []GoModule{
			{Exe: "bar"},
			{Exe: "foo"},
		},
		Commander: commander.Output,
	}
	missingPackages, err := b.GetMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"foo"}, missingPackages)
}

func TestInstallingGoModules(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("go", []string{"install", "github.com/bar@latest"}, nil, nil)
	commander.ExpectOutput("go", []string{"install", "github.com/foo@latest"}, nil, nil)
	b := Plugin{
		Modules: []GoModule{
			{Exe: "bar", Path: "github.com/bar"},
			{Exe: "foo", Path: "github.com/foo"},
		},
		Commander: commander.Output,
	}
	err := b.Add([]string{"bar", "foo"})
	assert.NoError(t, err)
}

func TestTryingToInstallGoModulesWithEmptyListDoesNotCallBrew(t *testing.T) {
	b := Plugin{}
	err := b.Add([]string{})
	assert.NoError(t, err)
}

func TestUpdatingGoModules(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("go", []string{"install", "github.com/bar@latest"}, nil, nil)
	commander.ExpectOutput("go", []string{"install", "github.com/foo@latest"}, nil, nil)
	b := Plugin{
		Modules: []GoModule{
			{Exe: "bar", Path: "github.com/bar"},
			{Exe: "foo", Path: "github.com/foo"},
		},
		Commander: commander.Output,
	}
	err := b.Update()
	assert.NoError(t, err)
}
