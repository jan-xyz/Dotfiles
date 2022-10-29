package brewbottles

import (
	"errors"
	"testing"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/stretchr/testify/assert"
)

func TestGetMissingBrewPackage(t *testing.T) {
	type prepareCommander = func(c *dotfiles.MockCommander)
	tests := []struct {
		name             string
		prepareCommander prepareCommander
		expectedPackages []string
		wantErr          bool
	}{
		{
			name: "successfully get packages",
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("brew", []string{"list", "--formula"}).Return([]byte("foo"), nil)
				c.OnOutput("brew", []string{"list", "--casks"}).Return([]byte("bar"), nil)
			},
			expectedPackages: []string{"baz"},
		},
		{
			name: "fails if list casks fails",
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("brew", []string{"list", "--formula"}).Return([]byte("foo"), nil)
				c.OnOutput("brew", []string{"list", "--casks"}).Return([]byte{}, errors.New("boom"))
			},
			wantErr: true,
		},
		{
			name: "fails if list forumla fails",
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("brew", []string{"list", "--formula"}).Return([]byte{}, errors.New("boom"))
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
				Bottles:   []string{"bar", "foo", "baz"},
				Commander: commander.Output,
			}
			missingPackages, err := b.GetMissingPackages()
			if tt.wantErr {
				assert.Error(t, err)
			} else {
				assert.NoError(t, err)
				assert.Equal(t, tt.expectedPackages, missingPackages)
			}
		})
	}
}

func TestAdd(t *testing.T) {
	type prepareCommander = func(c *dotfiles.MockCommander)
	tests := []struct {
		name             string
		input            []string
		prepareCommander prepareCommander
		wantErr          bool
	}{
		{
			name:  "successfully install packages",
			input: []string{"bar", "foo"},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("brew", []string{"install", "bar", "foo"}).Return(nil, nil)
			},
			wantErr: false,
		},
		{
			name:  "ignores call if list of installable packages is empty",
			input: []string{},
			prepareCommander: func(c *dotfiles.MockCommander) {
			},
			wantErr: false,
		},
		{
			name:  "fails if installing packages fails",
			input: []string{"bar", "foo"},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("brew", []string{"install", "bar", "foo"}).Return(nil, errors.New("boom"))
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
	type prepareCommander = func(c *dotfiles.MockCommander)
	tests := []struct {
		name             string
		prepareCommander prepareCommander
		wantErr          bool
	}{
		{
			name: "successfully update packages",
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("brew", []string{"upgrade"}).Return(nil, nil)
			},
			wantErr: false,
		},
		{
			name: "fails if update packages fails",
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("brew", []string{"upgrade"}).Return(nil, errors.New("boom"))
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
