package brewtaps

import (
	"errors"
	"testing"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/stretchr/testify/assert"
)

func TestGetMissingPackage(t *testing.T) {
	type prepareCommander = func(c *dotfiles.MockCommander)
	tests := []struct {
		name             string
		configuredApps   []string
		prepareCommander prepareCommander
		expectedApps     []string
		wantErr          bool
	}{
		{
			name:           "succesfully get taps",
			configuredApps: []string{"bar", "foo"},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("brew", []string{"tap"}).Return([]byte("bar"), nil)
			},
			expectedApps: []string{"foo"},
			wantErr:      false,
		},
		{
			name:           "fail if calling brew fails",
			configuredApps: []string{"bar", "foo"},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("brew", []string{"tap"}).Return([]byte{}, errors.New("boom"))
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
				Taps:      tt.configuredApps,
				Commander: commander.Output,
			}
			actualLinks, err := b.GetMissingPackages()
			if tt.wantErr {
				assert.Error(t, err)
			} else {
				assert.NoError(t, err)
				assert.ElementsMatch(t, tt.expectedApps, actualLinks)
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
			name:  "succefully install taps",
			input: []string{"bar", "foo"},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("brew", []string{"tap", "bar", "foo"}).Return(nil, nil)
			},
			wantErr: false,
		},
		{
			name:  "fail if calling brew fails",
			input: []string{"bar", "foo"},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("brew", []string{"tap", "bar", "foo"}).Return(nil, errors.New("boom"))
			},
			wantErr: true,
		},
		{
			name:             "ignore empty input",
			input:            []string{},
			prepareCommander: func(_ *dotfiles.MockCommander) {},
			wantErr:          false,
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
		name    string
		wantErr bool
	}{
		{
			name:    "not implemented",
			wantErr: false,
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
