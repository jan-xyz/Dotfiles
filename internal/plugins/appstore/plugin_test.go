package appstore

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
		configuredApps   []App
		prepareCommander prepareCommander
		expectedApps     []string
		wantErr          bool
	}{
		{
			name: "succesfully get apps",
			configuredApps: []App{
				{Name: "foo", ID: "1482454543"},
				{Name: "bar", ID: "1463400445"},
				{Name: "baz", ID: "1460715987"},
			},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("bash", []string{"-c", "mas list | awk '{print $1;}'"}).Return([]byte("1482454543\n1463400445"), nil)
			},
			expectedApps: []string{"1460715987"},
			wantErr:      false,
		},
		{
			name:           "fail if mas command fails",
			configuredApps: []App{},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("bash", []string{"-c", "mas list | awk '{print $1;}'"}).Return([]byte{}, errors.New("boom"))
			},
			expectedApps: []string{},
			wantErr:      true,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			commander := dotfiles.MockCommander{}
			defer commander.AssertExpectations(t)
			tt.prepareCommander(&commander)

			b := Plugin{
				Apps:      tt.configuredApps,
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
		configuredLinks  []App
		prepareCommander func(c *dotfiles.MockCommander)
		wantErr          bool
	}{
		{
			name:  "succefully set symlinks",
			input: []string{"1482454543", "1463400445"},
			configuredLinks: []App{
				{Name: "foo", ID: "1482454543"},
				{Name: "bar", ID: "1463400445"},
			},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("mas", []string{"install", "1482454543", "1463400445"}).Return(nil, nil)
			},
			wantErr: false,
		},
		{
			name:            "ignore empty input",
			input:           []string{},
			configuredLinks: []App{},
			prepareCommander: func(c *dotfiles.MockCommander) {
			},
			wantErr: false,
		},
		{
			name:  "fails if calling mas app fails",
			input: []string{"1482454543", "1463400445"},
			configuredLinks: []App{
				{Name: "foo", ID: "1482454543"},
				{Name: "bar", ID: "1463400445"},
			},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("mas", []string{"install", "1482454543", "1463400445"}).Return(nil, errors.New("boom"))
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
				Apps:      tt.configuredLinks,
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
			name: "succesfully update apps",
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("mas", []string{"upgrade"}).Return(nil, nil)
			},
			wantErr: false,
		},
		{
			name: "fail update it mas app fails",
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("mas", []string{"upgrade"}).Return(nil, errors.New("boom"))
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
