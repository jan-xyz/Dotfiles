package main

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
	b := npm{
		packages:  []string{"bar", "foo"},
		commander: commander.Output,
	}
	missingPackages, err := b.getMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"foo"}, missingPackages)
}

func TestInstallingNPMPackage(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("npm", []string{"install", "--global", "bar", "foo"}, nil, nil)
	b := npm{
		commander: commander.Output,
	}
	err := b.installPackages([]string{"bar", "foo"})
	assert.NoError(t, err)
}

func TestTryingToInstallNPMPackageWithEmptyListDoesNotCallCode(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	b := npm{
		commander: commander.Output,
	}
	err := b.installPackages([]string{})
	assert.NoError(t, err)
}
