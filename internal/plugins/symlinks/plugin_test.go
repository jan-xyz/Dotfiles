package symlinks

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
		name             string
		configuredLinks  []Link
		prepareCommander prepareCommander
		prepareEnv       func() (unsetEnv func())
		expectedLinks    []string
		wantErr          bool
	}{
		{
			name: "succesfully get symlinks",
			configuredLinks: []Link{
				{LinkName: "fooLinkName", SourceFile: "fooSourceFile"},
				{LinkName: "barLinkName", SourceFile: "barSourceFile"},
				{LinkName: "bazLinkName", SourceFile: "bazSourceFile"},
			},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("readlink", []string{"fooLinkName"}).Return(nil, errors.New("not-there"))
				c.OnOutput("readlink", []string{"barLinkName"}).Return([]byte("barSourceFile"), nil)
				c.OnOutput("readlink", []string{"bazLinkName"}).Return([]byte("wrong-symlink"), nil)
			},
			prepareEnv:    func() (unsetEnv func()) { return func() {} },
			expectedLinks: []string{"fooLinkName", "bazLinkName"},
			wantErr:       false,
		},
		{
			name: "succesfully get symlinks on expanding env",
			configuredLinks: []Link{
				{LinkName: "fuzLinkName", SourceFile: "${FOO}"},
			},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("readlink", []string{"fuzLinkName"}).Return([]byte("FooBarBaz"), nil)
			},
			prepareEnv: func() (unsetEnv func()) {
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
			expectedLinks: []string{},
			wantErr:       false,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			commander := dotfiles.MockCommander{}
			defer commander.AssertExpectations(t)
			tt.prepareCommander(&commander)

			defer tt.prepareEnv()()

			b := Plugin{
				Links:     tt.configuredLinks,
				Commander: commander.Output,
			}
			actualLinks, err := b.GetMissingPackages()
			if tt.wantErr {
				assert.Error(t, err)
			} else {
				assert.NoError(t, err)
				assert.ElementsMatch(t, tt.expectedLinks, actualLinks)
			}
		})
	}
}

func TestAdd(t *testing.T) {
	tests := []struct {
		name             string
		input            []string
		configuredLinks  []Link
		prepareCommander func(c *dotfiles.MockCommander)
		prepareEnv       func() (unsetEnv func())
		wantErr          bool
	}{
		{
			name:  "succefully set symlinks",
			input: []string{"barLinkName"},
			configuredLinks: []Link{
				{SourceFile: "barSourceFile", LinkName: "barLinkName"},
				{SourceFile: "fooSourceFile", LinkName: "fooLinkName"},
			},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("mkdir", []string{"-p", "."}).Return(nil, nil)
				c.OnOutput("ln", []string{"-snf", "barSourceFile", "barLinkName"}).Return(nil, nil)
			},
			prepareEnv: func() (unsetEnv func()) { return func() {} },
			wantErr:    false,
		},
		{
			name:            "sucessfully set symlinks for env variable",
			input:           []string{"${FOO}"},
			configuredLinks: []Link{{SourceFile: "barSourceFile", LinkName: "${FOO}"}},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("mkdir", []string{"-p", "."}).Return(nil, nil)
				c.OnOutput("ln", []string{"-snf", "barSourceFile", "FooBarBaz"}).Return(nil, nil)
			},
			prepareEnv: func() (unsetEnv func()) {
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
			name:  "fails if directory creatin fails",
			input: []string{"barLinkName"},
			configuredLinks: []Link{
				{SourceFile: "barSourceFile", LinkName: "barLinkName"},
				{SourceFile: "fooSourceFile", LinkName: "fooLinkName"},
			},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("mkdir", []string{"-p", "."}).Return(nil, errors.New("boom"))
			},
			prepareEnv: func() (unsetEnv func()) { return func() {} },
			wantErr:    true,
		},
		{
			name:  "fails if symlink creation fails",
			input: []string{"barLinkName"},
			configuredLinks: []Link{
				{SourceFile: "barSourceFile", LinkName: "barLinkName"},
				{SourceFile: "fooSourceFile", LinkName: "fooLinkName"},
			},
			prepareCommander: func(c *dotfiles.MockCommander) {
				c.OnOutput("mkdir", []string{"-p", "."}).Return(nil, nil)
				c.OnOutput("ln", []string{"-snf", "barSourceFile", "barLinkName"}).Return(nil, errors.New("boom"))
			},
			prepareEnv: func() (unsetEnv func()) { return func() {} },
			wantErr:    true,
		},
		{
			name:             "ignores calling with symlink that is not configured",
			input:            []string{"not-configured"},
			configuredLinks:  []Link{},
			prepareCommander: func(_ *dotfiles.MockCommander) {},
			prepareEnv:       func() func() { return func() {} },
			wantErr:          false,
		},
		{
			name:             "ignores calling with empty list",
			input:            []string{},
			configuredLinks:  []Link{},
			prepareCommander: func(_ *dotfiles.MockCommander) {},
			prepareEnv:       func() func() { return func() {} },
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
				Links:     tt.configuredLinks,
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
