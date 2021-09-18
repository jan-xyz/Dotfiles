package dotfiles

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetMissingJuliaModules(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput(
		"julia",
		[]string{"-e", "import Pkg;Pkg.status()"},
		[]byte("Status `~/.julia/environments/v1.6/Project.toml`\n [2b0e0bc5] bar v4.1.0\n [c3e4b0f8] Pluto v0.15.1Pkg\n"),
		nil,
	)
	b := Julia{
		Modules:   []string{"bar", "foo"},
		Commander: commander.Output,
	}
	missingPackages, err := b.GetMissingPackages()
	assert.NoError(t, err)
	assert.Equal(t, []string{"foo"}, missingPackages)
}

func TestInstallingJuliaModules(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput(
		"julia",
		[]string{"-e", "import Pkg;Pkg.add.([\"bar\",\"foo\"])"},
		nil,
		nil,
	)
	b := Julia{
		Commander: commander.Output,
	}
	err := b.Add([]string{"bar", "foo"})
	assert.NoError(t, err)
}

func TestTryingToInstallJuliaModulesWithEmptyListDoesNotCallCode(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	b := Julia{
		Commander: commander.Output,
	}
	err := b.Add([]string{})
	assert.NoError(t, err)
}

func TestUpdatingJulaModules(t *testing.T) {
	commander := mockCommander{}
	defer commander.AssertExpectations(t)
	commander.ExpectOutput("julia", []string{"-e", "import Pkg;Pkg.update()"}, nil, nil)
	b := Julia{
		Commander: commander.Output,
	}
	err := b.Update()
	assert.NoError(t, err)
}
