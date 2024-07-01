package systemprefs

import (
	"errors"
	"os"
	"testing"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/stretchr/testify/assert"
)

func TestGetMissingPackage(t *testing.T) {
	type prepareCommander = func(c *dotfiles.MockCommander)
	tests := []struct {
		name               string
		configuredPackages []Preference
		prepareCommander   prepareCommander
		prepareEnv         func() (unsetEnv func())
		expectedPackages   []string
		wantErr            bool
	}{
		{
			name: "succesfully get packages",
			configuredPackages: []Preference{
				{Name: "foo.bar", Type: "int", Value: "1"},
				{Name: "baz.fuu", Type: "int", Value: "1"},
			},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("defaults", []string{"read", "foo", "bar"}).Return([]byte("0\n"), nil)
				c.OnOutput("defaults", []string{"read", "baz", "fuu"}).Return([]byte("1\n"), nil)
			},
			prepareEnv:       func() func() { return func() {} },
			expectedPackages: []string{"foo.bar"},
			wantErr:          false,
		},
		{
			name: "expands env variables",
			configuredPackages: []Preference{
				{Name: "foo.bar", Type: "int", Value: "${FOO}"},
			},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("defaults", []string{"read", "foo", "bar"}).Return([]byte("FooBarBaz\n"), nil)
			},
			prepareEnv: func() func() {
				val, ok := os.LookupEnv("FOO")
				os.Setenv("FOO", "FooBarBaz")
				return func() {
					if ok {
						os.Setenv("FOO", val)
					} else {
						os.Unsetenv("FOO")
					}
				}
			},
			expectedPackages: []string{},
			wantErr:          false,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			commander := dotfiles.MockCommander{}
			defer commander.AssertExpectations(t)
			tt.prepareCommander(&commander)

			defer tt.prepareEnv()()

			b := Plugin{
				Preferences: tt.configuredPackages,
				Commander:   commander.Output,
			}
			actualLinks, err := b.GetMissingPackages()
			if tt.wantErr {
				assert.Error(t, err)
			} else {
				assert.NoError(t, err)
				assert.ElementsMatch(t, tt.expectedPackages, actualLinks)
			}
		})
	}
}

func TestAdd(t *testing.T) {
	tests := []struct {
		name               string
		input              []string
		configuredPackages []Preference
		prepareCommander   func(c *dotfiles.MockCommander)
		prepareEnv         func() (unsetEnv func())
		wantErr            bool
	}{
		{
			name:  "succefully setting preference",
			input: []string{"foo.bar"},
			configuredPackages: []Preference{
				{Name: "foo.bar", Type: "int", Value: "1"},
			},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("defaults", []string{"write", "foo", "bar", "-int", "1"}).Return(nil, nil)
			},
			prepareEnv: func() func() { return func() {} },
			wantErr:    false,
		},
		{
			name:  "expands env variables",
			input: []string{"foo.bar"},
			configuredPackages: []Preference{
				{Name: "foo.bar", Type: "int", Value: "${FOO}"},
			},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("defaults", []string{"write", "foo", "bar", "-int", "FooBarBaz"}).Return(nil, nil)
			},
			prepareEnv: func() func() {
				val, ok := os.LookupEnv("FOO")
				os.Setenv("FOO", "FooBarBaz")
				return func() {
					if ok {
						os.Setenv("FOO", val)
					} else {
						os.Unsetenv("FOO")
					}
				}
			},
			wantErr: false,
		},
		{
			name:               "ignore empty input",
			input:              []string{},
			configuredPackages: []Preference{},
			prepareCommander:   func(_ *dotfiles.MockCommander) {},
			prepareEnv:         func() func() { return func() {} },
			wantErr:            false,
		},
		{
			name:  "fails if setting preference fails",
			input: []string{"foo.bar"},
			configuredPackages: []Preference{
				{Name: "foo.bar", Type: "int", Value: "1"},
			},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("defaults", []string{"write", "foo", "bar", "-int", "1"}).Return(nil, errors.New("boom"))
			},
			prepareEnv: func() func() { return func() {} },
			wantErr:    true,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			commander := dotfiles.MockCommander{}
			defer commander.AssertExpectations(t)
			tt.prepareCommander(&commander)

			defer tt.prepareEnv()()

			b := Plugin{
				Preferences: tt.configuredPackages,
				Commander:   commander.Output,
			}
			err := b.Add(tt.input)
			if tt.wantErr {
				assert.Error(t, err)
			} else {
				assert.NoError(t, err)
			}
		})
	}
}

func TestUpdate(t *testing.T) {
	tests := []struct {
		name    string
		wantErr bool
	}{
		{
			name: "not implemented",
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			commander := dotfiles.MockCommander{}
			defer commander.AssertExpectations(t)

			b := Plugin{
				Commander: commander.Output,
			}
			err := b.Update()
			if tt.wantErr {
				assert.Error(t, err)
			} else {
				assert.NoError(t, err)
			}
		})
	}
}
