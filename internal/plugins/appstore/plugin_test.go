package appstore

import (
	"testing"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/stretchr/testify/assert"
)

func TestGetMissingApps(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("mas", []string{"account"}, []byte("foo@example.com\n"), nil)
	commander.ExpectOutput("bash", []string{"-c", "mas list | awk '{print $1;}'"}, []byte("1482454543\n1463400445"), nil)
	b := Plugin{
		Profile: "foo@example.com",
		Apps: []App{
			{
				Name: "foo",
				ID:   "1482454543",
			},
			{
				Name: "bar",
				ID:   "1463400445",
			},
			{
				Name: "baz",
				ID:   "1460715987",
			},
		},
		Commander: commander.Output,
	}
	missingPackages, err := b.GetMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"1460715987"}, missingPackages)
}

func TestGetMissingAppsReturnsErrorWhenWrongSignIn(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("mas", []string{"account"}, []byte("foo@example.com"), nil)
	b := Plugin{
		Profile:   "bar@example.com",
		Commander: commander.Output,
	}
	_, err := b.GetMissingPackages()
	assert.Error(t, err)
}

func TestInstallingApps(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("mas", []string{"install", "1482454543", "1463400445"}, nil, nil)
	b := Plugin{
		Apps: []App{
			{
				Name: "foo",
				ID:   "1482454543",
			},
			{
				Name: "bar",
				ID:   "1463400445",
			},
		},
		Commander: commander.Output,
	}
	err := b.Add([]string{"1482454543", "1463400445"})
	assert.NoError(t, err)
}

func TestTryingToInstallAppWithEmptyListDoesNotCallMas(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	b := Plugin{
		Commander: commander.Output,
	}
	err := b.Add([]string{})
	assert.NoError(t, err)
}
