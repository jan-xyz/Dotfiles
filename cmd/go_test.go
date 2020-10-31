package main

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
	b := golang{
		packages: []goModule{
			{Exe: "bar"},
			{Exe: "foo"},
		},
		commander: commander.Output,
	}
	missingPackages, err := b.getMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"foo"}, missingPackages)
}

func TestInstallingGoModules(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("go", []string{"get", "github.com/bar", "github.com/foo"}, nil, nil)
	b := golang{
		packages: []goModule{
			{Exe: "bar", Path: "github.com/bar"},
			{Exe: "foo", Path: "github.com/foo"},
		},
		commander: commander.Output,
	}
	err := b.installPackages([]string{"bar", "foo"})
	assert.NoError(t, err)
}

func TestTryingToInstallGoModulesWithEmptyListDoesNotCallBrew(t *testing.T) {
	b := golang{}
	err := b.installPackages([]string{})
	assert.NoError(t, err)
}
