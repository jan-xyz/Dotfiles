package symlinks

import (
	"errors"
	"os"
	"testing"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/stretchr/testify/assert"
)

func TestGetMissingSymlinks(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("readlink", []string{"fooLinkName"}, nil, errors.New("not-there"))
	commander.ExpectOutput("readlink", []string{"barLinkName"}, []byte("barSourceFile"), nil)
	commander.ExpectOutput("readlink", []string{"bazLinkName"}, []byte("wrong-symlink"), nil)
	b := Plugin{
		Links: []Link{
			{LinkName: "fooLinkName", SourceFile: "fooSourceFile"},
			{LinkName: "barLinkName", SourceFile: "barSourceFile"},
			{LinkName: "bazLinkName", SourceFile: "bazSourceFile"},
		},
		Commander: commander.Output,
	}
	missingPackages, err := b.GetMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"fooLinkName", "bazLinkName"}, missingPackages)
}

func TestGetMissingSymlinksExpandsSymLinks(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	os.Setenv("FOO", "FooBarBaz")
	defer os.Unsetenv("FOO")
	commander.ExpectOutput("readlink", []string{"barLinkName"}, []byte("FooBarBaz"), nil)
	b := Plugin{
		Links: []Link{
			{LinkName: "barLinkName", SourceFile: "${FOO}"},
		},
		Commander: commander.Output,
	}
	missingPackages, err := b.GetMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{}, missingPackages)
}

func TestInstallingSymlinks(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("mkdir", []string{"-p", "."}, nil, nil)
	commander.ExpectOutput("ln", []string{"-sf", "barSourceFile", "barLinkName"}, nil, nil)
	b := Plugin{
		Links: []Link{
			{SourceFile: "barSourceFile", LinkName: "barLinkName"},
			{SourceFile: "fooSourceFile", LinkName: "fooLinkName"},
		},
		Commander: commander.Output,
	}
	err := b.Add([]string{"barLinkName"})
	assert.NoError(t, err)
}

func TestInstallingSymlinksExpandsEnvironmentVariables(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	os.Setenv("FOO", "FooBarBaz")
	defer os.Unsetenv("FOO")
	commander.ExpectOutput("mkdir", []string{"-p", "."}, nil, nil)
	commander.ExpectOutput("ln", []string{"-sf", "barSourceFile", "FooBarBaz"}, nil, nil)
	b := Plugin{
		Links: []Link{
			{SourceFile: "barSourceFile", LinkName: "${FOO}"},
		},
		Commander: commander.Output,
	}
	err := b.Add([]string{"${FOO}"})
	assert.NoError(t, err)
}

func TestTryingToLinkSymlinksWithEmptyListDoesNotCallLink(t *testing.T) {
	b := Plugin{}
	err := b.Add([]string{})
	assert.NoError(t, err)
}
