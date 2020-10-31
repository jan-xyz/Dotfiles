package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/mock"
)

type mockCommander struct {
	mock.Mock
}

func (c *mockCommander) Output(command string, arguments ...string) ([]byte, error) {
	args := c.Called(command, arguments)
	return args[0].([]byte), args.Error(1)
}

func (c *mockCommander) ExpectOutput(command string, arguments []string, mockReturn []byte, err error) {
	c.On("Output", command, arguments).Return(mockReturn, err)
}

func TestGetMissingBrewPackage(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("brew", []string{"list"}, []byte("bar"), nil)
	b := brew{
		packages:  []string{"bar", "foo"},
		commander: commander.Output,
	}
	missingPackages, err := b.getMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"foo"}, missingPackages)
}

func TestInstallingBrewPackage(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("brew", []string{"install", "bar", "foo"}, nil, nil)
	b := brew{
		commander: commander.Output,
	}
	err := b.installPackages([]string{"bar", "foo"})
	assert.NoError(t, err)
}

func TestTryingToInstallBrewPackageWithEmptyListDoesNotCallBrew(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	b := brew{
		commander: commander.Output,
	}
	err := b.installPackages([]string{})
	assert.NoError(t, err)
}
