package python

import (
	"errors"
	"testing"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/stretchr/testify/assert"
)

func TestUpdatingPythonPackage(t *testing.T) {
	c := dotfiles.MockCommander{}
	defer c.AssertExpectations(t)
	c.OnOutput("/opt/homebrew/bin/python3", []string{"-m", "pip", "install", "--upgrade", "bar", "foo"}).Return(nil, nil)
	b := Plugin{
		Packages:  []string{"bar", "foo"},
		Commander: c.Output,
	}
	err := b.Update()
	assert.NoError(t, err)
}

func TestGetMissingPackage(t *testing.T) {
	type prepareCommander = func(c *dotfiles.MockCommander)
	tests := []struct {
		name               string
		configuredPackages []string
		prepareCommander   prepareCommander
		expectedPackages   []string
		wantErr            bool
	}{
		{
			name:               "succesfully get packages",
			configuredPackages: []string{"bar", "foo"},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("/opt/homebrew/bin/python3", []string{"-m", "pip", "freeze"}).Return([]byte("bar==1.0.0"), nil)
			},
			expectedPackages: []string{"foo"},
			wantErr:          false,
		},
		{
			name:               "fail if python command fails",
			configuredPackages: []string{},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("/opt/homebrew/bin/python3", []string{"-m", "pip", "freeze"}).Return([]byte{}, errors.New("boom"))
			},
			wantErr: true,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			commander := dotfiles.MockCommander{}
			defer commander.AssertExpectations(t)
			tt.prepareCommander(&commander)

			b := Plugin{
				Packages:  tt.configuredPackages,
				Commander: commander.Output,
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
		name             string
		input            []string
		prepareCommander func(c *dotfiles.MockCommander)
		wantErr          bool
	}{
		{
			name:  "succefully install packages",
			input: []string{"bar", "foo"},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("/opt/homebrew/bin/python3", []string{"-m", "pip", "install", "bar", "foo"}).Return(nil, nil)
			},
			wantErr: false,
		},
		{
			name:  "ignore empty input",
			input: []string{},
			prepareCommander: func(c *dotfiles.MockCommander) {
			},
			wantErr: false,
		},
		{
			name:  "fails if calling python fails",
			input: []string{"bar", "foo"},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("/opt/homebrew/bin/python3", []string{"-m", "pip", "install", "bar", "foo"}).Return(nil, errors.New("boom"))
			},
			wantErr: true,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			commander := dotfiles.MockCommander{}
			defer commander.AssertExpectations(t)
			tt.prepareCommander(&commander)

			b := Plugin{
				Commander: commander.Output,
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
		name               string
		configuredPackages []string
		prepareCommander   func(c *dotfiles.MockCommander)
		wantErr            bool
	}{
		{
			name:               "succesfully update packages",
			configuredPackages: []string{"bar", "foo"},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("/opt/homebrew/bin/python3", []string{"-m", "pip", "install", "--upgrade", "bar", "foo"}).Return(nil, nil)
			},
			wantErr: false,
		},
		{
			name:               "fail update it python fails",
			configuredPackages: []string{"bar", "foo"},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("/opt/homebrew/bin/python3", []string{"-m", "pip", "install", "--upgrade", "bar", "foo"}).Return(nil, errors.New("boom"))
			},
			wantErr: true,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			commander := dotfiles.MockCommander{}
			defer commander.AssertExpectations(t)
			tt.prepareCommander(&commander)

			b := Plugin{
				Packages:  tt.configuredPackages,
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
