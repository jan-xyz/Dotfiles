package systemprefs

import (
	"os"
	"testing"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/stretchr/testify/assert"
)

func TestGetPreferenceDrift(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	commander.OnOutput("defaults", []string{"read", "foo", "bar"}).Return([]byte("0\n"), nil)
	commander.OnOutput("defaults", []string{"read", "baz", "fuu"}).Return([]byte("1\n"), nil)
	b := Plugin{
		Preferences: []Preference{
			{
				Name:  "foo.bar",
				Type:  "int",
				Value: "1",
			},
			{
				Name:  "baz.fuu",
				Type:  "int",
				Value: "1",
			},
		},
		Commander: commander.Output,
	}
	missingPackages, err := b.GetMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"foo.bar"}, missingPackages)
}

func TestGetPreferenceDriftExpandsEnvironmentVariables(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	os.Setenv("FOO", "FooBarBaz")
	defer os.Unsetenv("FOO")
	commander.OnOutput("defaults", []string{"read", "foo", "bar"}).Return([]byte("FooBarBaz\n"), nil)
	b := Plugin{
		Preferences: []Preference{
			{
				Name:  "foo.bar",
				Type:  "int",
				Value: "${FOO}",
			},
		},
		Commander: commander.Output,
	}
	missingPackages, err := b.GetMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{}, missingPackages)
}

func TestSettingPreferences(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	commander.OnOutput("defaults", []string{"write", "foo", "bar", "-int", "1"}).Return(nil, nil)
	b := Plugin{
		Preferences: []Preference{
			{
				Name:  "foo.bar",
				Type:  "int",
				Value: "1",
			},
		},
		Commander: commander.Output,
	}
	err := b.Add([]string{"foo.bar"})
	assert.NoError(t, err)
}

func TestSettingPreferencesExpandsEnvironmentVariables(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	os.Setenv("FOO", "FooBarBaz")
	defer os.Unsetenv("FOO")
	commander.OnOutput("defaults", []string{"write", "foo", "bar", "-int", "FooBarBaz"}).Return(nil, nil)
	b := Plugin{
		Preferences: []Preference{
			{
				Name:  "foo.bar",
				Type:  "int",
				Value: "${FOO}",
			},
		},
		Commander: commander.Output,
	}
	err := b.Add([]string{"foo.bar"})
	assert.NoError(t, err)
}

func TestTryingToSetPreferencesWithEmptyListDoesNotCallDefaults(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	b := Plugin{
		Commander: commander.Output,
	}
	err := b.Add([]string{})
	assert.NoError(t, err)
}
