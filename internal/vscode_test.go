package dotfiles

import (
	"testing"

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

		commander := mockCommander{}
		defer commander.AssertExpectations(t)
		commander.ExpectOutput("code", []string{"--list-extensions"}, testCase.applicationOutput, nil)
		b := VSCode{
			Extensions: testCase.input,
			Commander:  commander.Output,
		}
		missingPackages, err := b.GetMissingPackages()
		assert.NoError(t, err)
		assert.Equal(t, testCase.expected, missingPackages, testCase.name)
	}
}

func TestInstallingVSCodeExtension(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("code", []string{"--install-extension", "bar"}, nil, nil)
	commander.ExpectOutput("code", []string{"--install-extension", "foo"}, nil, nil)
	b := VSCode{
		Commander: commander.Output,
	}
	err := b.InstallPackages([]string{"bar", "foo"})
	assert.NoError(t, err)
}

func TestTryingToInstallVSCodeExtensionWithEmptyListDoesNotCallCode(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	b := VSCode{
		Commander: commander.Output,
	}
	err := b.InstallPackages([]string{})
	assert.NoError(t, err)
}
