package brewtaps

import (
	"testing"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/stretchr/testify/assert"
)

func TestGetMissingTaps(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	commander.OnOutput("brew", []string{"tap"}).Return([]byte("bar"), nil)
	b := Plugin{
		Taps:      []string{"bar", "foo"},
		Commander: commander.Output,
	}
	missingPackages, err := b.GetMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"foo"}, missingPackages)
}

func TestInstallingTaps(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	commander.OnOutput("brew", []string{"tap", "bar", "foo"}).Return(nil, nil)
	b := Plugin{
		Commander: commander.Output,
	}
	err := b.Add([]string{"bar", "foo"})
	assert.NoError(t, err)
}

func TestTryingToInstallTapsWithEmptyListDoesNotCallBrew(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	b := Plugin{
		Commander: commander.Output,
	}
	err := b.Add([]string{})
	assert.NoError(t, err)
}
