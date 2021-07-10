package dotfiles

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
	c.On("Output", command, arguments).Return(mockReturn, err).Once()
}

func TestGetMissingBrewPackage(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("brew", []string{"list", "--formula"}, []byte("foo"), nil)
	commander.ExpectOutput("brew", []string{"list", "--casks"}, []byte("bar"), nil)
	b := BrewBottles{
		Bottles:   []string{"bar", "foo", "baz"},
		Commander: commander.Output,
	}
	missingPackages, err := b.GetMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"baz"}, missingPackages)
}

func TestInstallingBrewPackage(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("brew", []string{"install", "bar", "foo"}, nil, nil)
	b := BrewBottles{
		Commander: commander.Output,
	}
	err := b.InstallPackages([]string{"bar", "foo"})
	assert.NoError(t, err)
}

func TestTryingToInstallBrewPackageWithEmptyListDoesNotCallBrew(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	b := BrewBottles{
		Commander: commander.Output,
	}
	err := b.InstallPackages([]string{})
	assert.NoError(t, err)
}
