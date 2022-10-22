package vscode

import (
	"testing"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/stretchr/testify/assert"
)

func TestGetMissingVSCodeExtension(t *testing.T) {
	testCases := []struct {
		name              string
		input             []string
		applicationOutput []byte
		expected          []string
	}{
		{
			name:              "normal case",
			input:             []string{"bar", "foo"},
			applicationOutput: []byte("bar"),
			expected:          []string{"foo"},
		},
		{
			name:              "multiple in output",
			input:             []string{"bar", "foo"},
			applicationOutput: []byte("bar\nbaz"),
			expected:          []string{"foo"},
		},
		{
			name:              "upper-case in input",
			input:             []string{"Bar", "foo"},
			applicationOutput: []byte("bar"),
			expected:          []string{"foo"},
		},
		{
			name:              "upper-case in output",
			input:             []string{"bar", "foo"},
			applicationOutput: []byte("Bar"),
			expected:          []string{"foo"},
		},
	}

	for _, testCase := range testCases {

		commander := dotfiles.MockCommander{}
		defer commander.AssertExpectations(t)
		commander.OnOutput("code", []string{"--list-extensions"}).Return(testCase.applicationOutput, nil)
		b := Plugin{
			Extensions: testCase.input,
			Commander:  commander.Output,
		}
		missingPackages, err := b.GetMissingPackages()
		assert.NoError(t, err)
		assert.Equal(t, testCase.expected, missingPackages, testCase.name)
	}
}

func TestInstallingVSCodeExtension(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	commander.OnOutput("code", []string{"--install-extension", "bar"}).Return(nil, nil)
	commander.OnOutput("code", []string{"--install-extension", "foo"}).Return(nil, nil)
	b := Plugin{
		Commander: commander.Output,
	}
	err := b.Add([]string{"bar", "foo"})
	assert.NoError(t, err)
}

func TestTryingToInstallVSCodeExtensionWithEmptyListDoesNotCallCode(t *testing.T) {
	commander := dotfiles.MockCommander{}
	defer commander.AssertExpectations(t)
	b := Plugin{
		Commander: commander.Output,
	}
	err := b.Add([]string{})
	assert.NoError(t, err)
}
