package dotfiles

import (
	"errors"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetMissingGoModules(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("command", []string{"-v", "bar"}, nil, nil)
	commander.ExpectOutput("command", []string{"-v", "foo"}, nil, errors.New("some-error"))
	b := Go{
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
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("go", []string{"get", "github.com/bar", "github.com/foo"}, nil, nil)
	b := Go{
		Modules: []GoModule{
			{Exe: "bar", Path: "github.com/bar"},
			{Exe: "foo", Path: "github.com/foo"},
		},
		Commander: commander.Output,
	}
	err := b.InstallPackages([]string{"bar", "foo"})
	assert.NoError(t, err)
}

func TestTryingToInstallGoModulesWithEmptyListDoesNotCallBrew(t *testing.T) {
	b := Go{}
	err := b.InstallPackages([]string{})
	assert.NoError(t, err)
}
