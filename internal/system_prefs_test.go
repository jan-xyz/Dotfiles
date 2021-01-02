package dotfiles

import (
	"os"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetPreferenceDrift(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("defaults", []string{"read", "foo", "bar"}, []byte("0\n"), nil)
	commander.ExpectOutput("defaults", []string{"read", "baz", "fuu"}, []byte("1\n"), nil)
	b := SystemPreferences{
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
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	os.Setenv("FOO", "FooBarBaz")
	defer os.Unsetenv("FOO")
	commander.ExpectOutput("defaults", []string{"read", "foo", "bar"}, []byte("FooBarBaz\n"), nil)
	b := SystemPreferences{
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
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("defaults", []string{"write", "foo", "bar", "-int", "1"}, nil, nil)
	b := SystemPreferences{
		Preferences: []Preference{
			{
				Name:  "foo.bar",
				Type:  "int",
				Value: "1",
			},
		},
		Commander: commander.Output,
	}
	err := b.InstallPackages([]string{"foo.bar"})
	assert.NoError(t, err)
}

func TestSettingPreferencesExpandsEnvironmentVariables(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	os.Setenv("FOO", "FooBarBaz")
	defer os.Unsetenv("FOO")
	commander.ExpectOutput("defaults", []string{"write", "foo", "bar", "-int", "FooBarBaz"}, nil, nil)
	b := SystemPreferences{
		Preferences: []Preference{
			{
				Name:  "foo.bar",
				Type:  "int",
				Value: "${FOO}",
			},
		},
		Commander: commander.Output,
	}
	err := b.InstallPackages([]string{"foo.bar"})
	assert.NoError(t, err)
}

func TestTryingToSetPreferencesWithEmptyListDoesNotCallDefaults(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	b := SystemPreferences{
		Commander: commander.Output,
	}
	err := b.InstallPackages([]string{})
	assert.NoError(t, err)
}
