package dotfiles

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetMissingApps(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("mas", []string{"account"}, []byte("foo@example.com"), nil)
	commander.ExpectOutput("bash", []string{"-c", "mas list | awk '{print $1;}'"}, []byte("1482454543\n1463400445"), nil)
	b := AppStore{
		Profile: "foo@example.com",
		Apps: []App{
			{
				Name: "foo",
				Id:   "1482454543",
			},
			{
				Name: "bar",
				Id:   "1463400445",
			},
			{
				Name: "baz",
				Id:   "1460715987",
			},
		},
		Commander: commander.Output,
	}
	missingPackages, err := b.GetMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"1460715987"}, missingPackages)
}

func TestGetMissingAppsReturnsErrorWhenWrongSignIn(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("mas", []string{"account"}, []byte("foo@example.com"), nil)
	b := AppStore{
		Profile:   "bar@example.com",
		Commander: commander.Output,
	}
	_, err := b.GetMissingPackages()
	assert.Error(t, err)
}

func TestInstallingApps(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("mas", []string{"install", "1482454543", "1463400445"}, nil, nil)
	b := AppStore{
		Apps: []App{
			{
				Name: "foo",
				Id:   "1482454543",
			},
			{
				Name: "bar",
				Id:   "1463400445",
			},
		},
		Commander: commander.Output,
	}
	err := b.InstallPackages([]string{"1482454543", "1463400445"})
	assert.NoError(t, err)
}

func TestTryingToInstallAppWithEmptyListDoesNotCallMas(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	b := AppStore{
		Commander: commander.Output,
	}
	err := b.InstallPackages([]string{})
	assert.NoError(t, err)
}
