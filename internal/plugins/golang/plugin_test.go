package golang

import (
	"errors"
	"testing"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/stretchr/testify/assert"
)

func TestGetMissingPackage(t *testing.T) {
	type prepareCommander = func(c *dotfiles.MockCommander)
	tests := []struct {
		name               string
		configuredPackages []GoModule
		prepareCommander   prepareCommander
		expectedPackages   []string
		wantErr            bool
	}{
		{
			name: "succesfully get packages",
			configuredPackages: []GoModule{
				{Exe: "bar"},
				{Exe: "foo"},
			},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("command", []string{"-v", "bar"}).Return(nil, nil)
				c.OnOutput("command", []string{"-v", "foo"}).Return(nil, errors.New("some-error"))
			},
			expectedPackages: []string{"foo"},
			wantErr:          false,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			commander := dotfiles.MockCommander{}
			defer commander.AssertExpectations(t)
			tt.prepareCommander(&commander)

			b := Plugin{
				Modules:   tt.configuredPackages,
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
		name               string
		input              []string
		configuredPackages []GoModule
		prepareCommander   func(c *dotfiles.MockCommander)
		wantErr            bool
	}{
		{
			name:  "succefully install packages",
			input: []string{"bar", "foo"},
			configuredPackages: []GoModule{
				{Exe: "bar", Path: "github.com/bar"},
				{Exe: "foo", Path: "github.com/foo"},
			},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("go", []string{"install", "github.com/bar@latest"}).Return(nil, nil)
				c.OnOutput("go", []string{"install", "github.com/foo@latest"}).Return(nil, nil)
			},
			wantErr: false,
		},
		{
			name:             "ignore empty input",
			input:            []string{},
			prepareCommander: func(_ *dotfiles.MockCommander) {},
			wantErr:          false,
		},
		{
			name:             "ignore not configured binaries",
			input:            []string{"foo"},
			prepareCommander: func(_ *dotfiles.MockCommander) {},
			wantErr:          false,
		},
		{
			name:  "fails if calling python fails",
			input: []string{"bar", "foo"},
			configuredPackages: []GoModule{
				{Exe: "bar", Path: "github.com/bar"},
				{Exe: "foo", Path: "github.com/foo"},
			},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("go", []string{"install", "github.com/bar@latest"}).Return(nil, nil)
				c.OnOutput("go", []string{"install", "github.com/foo@latest"}).Return(nil, errors.New("boom"))
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
				Modules:   tt.configuredPackages,
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
		configuredPackages []GoModule
		prepareCommander   func(c *dotfiles.MockCommander)
		wantErr            bool
	}{
		{
			name: "succesfully update packages",
			configuredPackages: []GoModule{
				{Exe: "bar", Path: "github.com/bar"},
				{Exe: "foo", Path: "github.com/foo"},
			},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("go", []string{"install", "github.com/bar@latest"}).Return(nil, nil)
				c.OnOutput("go", []string{"install", "github.com/foo@latest"}).Return(nil, nil)
			},
			wantErr: false,
		},
		{
			name: "fail update it python fails",
			configuredPackages: []GoModule{
				{Exe: "bar", Path: "github.com/bar"},
				{Exe: "foo", Path: "github.com/foo"},
			},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("go", []string{"install", "github.com/bar@latest"}).Return(nil, nil)
				c.OnOutput("go", []string{"install", "github.com/foo@latest"}).Return(nil, errors.New("boom"))
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
				Modules:   tt.configuredPackages,
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
