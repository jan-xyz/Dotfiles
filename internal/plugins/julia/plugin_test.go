package julia

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
		configuredPackages []string
		prepareCommander   prepareCommander
		expectedPackages   []string
		wantErr            bool
	}{
		{
			name:               "succesfully get packages",
			configuredPackages: []string{"bar", "foo"},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("julia", []string{"-e", "import Pkg;Pkg.status()"}).Return([]byte("Status `~/.julia/environments/v1.6/Project.toml`\n [2b0e0bc5] bar v4.1.0\n [c3e4b0f8] Pluto v0.15.1Pkg\n"), nil)
			},
			expectedPackages: []string{"foo"},
			wantErr:          false,
		},
		{
			name:               "fails when calling julia fails",
			configuredPackages: []string{"bar", "foo"},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("julia", []string{"-e", "import Pkg;Pkg.status()"}).Return([]byte{}, errors.New("boom"))
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
				c.OnOutput("julia", []string{"-e", "import Pkg;Pkg.add.([\"bar\",\"foo\"])"}).Return(nil, nil)
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
			name:  "ignores if calling julia fails",
			input: []string{"bar", "foo"},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("julia", []string{"-e", "import Pkg;Pkg.add.([\"bar\",\"foo\"])"}).Return(nil, errors.New("boom"))
			},
			wantErr: false,
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
		name             string
		prepareCommander func(c *dotfiles.MockCommander)
		wantErr          bool
	}{
		{
			name: "succesfully update packages",
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("julia", []string{"-e", "import Pkg;Pkg.update()"}).Return(nil, nil)
			},
			wantErr: false,
		},
		{
			name: "fails if calling julia fails",
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("julia", []string{"-e", "import Pkg;Pkg.update()"}).Return(nil, errors.New("boom"))
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
			err := b.Update()
			if tt.wantErr {
				assert.Error(t, err)
			} else {
				assert.NoError(t, err)
			}
		})
	}
}
