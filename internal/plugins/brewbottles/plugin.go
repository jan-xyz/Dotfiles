// Package brewbottles is the plugin to interface with brew to install bottles and casks
package brewbottles

import (
	"strings"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/sirupsen/logrus"
)

var brewExe = "/opt/homebrew/bin/brew"

// Plugin holds the configuration for all hombrew packages.
type Plugin struct {
	Bottles   []string
	Commander dotfiles.Commander
}

// GetMissingPackages returns a list of brew packages which are configured
// but not currently installed.
func (b Plugin) GetMissingPackages() ([]string, error) {
	stdout, err := b.Commander(brewExe, "list", "--formula")
	if err != nil {
		return nil, err
	}
	logrus.WithField("output", string(stdout)).Debug("homebrew stdout")
	installedFormulae := strings.Split(string(stdout), "\n")
	stdout, err = b.Commander(brewExe, "list", "--casks")
	if err != nil {
		return nil, err
	}
	logrus.WithField("output", string(stdout)).Debug("homebrew stdout")
	installedCasks := strings.Split(string(stdout), "\n")
	installedMap := map[string]bool{}
	for _, p := range append(installedFormulae, installedCasks...) {
		installedMap[p] = true
	}

	missingBottles := []string{}
	for _, bottle := range b.Bottles {
		if ok := installedMap[bottle]; !ok {
			missingBottles = append(missingBottles, bottle)
		}
	}

	return missingBottles, nil
}

// Add takes a list of brew package names for installation.
func (b Plugin) Add(packages []string) error {
	if len(packages) == 0 {
		logrus.Info("no Hombrew bottles to install")
		return nil
	}
	logrus.Info("Installing brew packages:", packages)
	args := append([]string{"install"}, packages...)
	_, err := b.Commander(brewExe, args...)
	if err != nil {
		logrus.Error("Failed installing brew packages:", err)
		return err
	}
	return nil
}

// Update updates all currently installed brew packages.
func (b Plugin) Update() error {
	logrus.Info("Upgrading brew packages")
	_, err := b.Commander(brewExe, "upgrade")
	if err != nil {
		logrus.Error("Failed update brew bottles:", err)
		return err
	}
	return nil
}
