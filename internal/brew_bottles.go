package dotfiles

import (
	"strings"

	"github.com/sirupsen/logrus"
)

var brewExe = "brew"

// BrewBottles holds the configuration for all hombrew packages.
type BrewBottles struct {
	Bottles   []string
	Commander Commander
}

// GetMissingPackages returns a list of brew packages which are configured
// but not currently installed.
func (b BrewBottles) GetMissingPackages() ([]string, error) {
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

// InstallPackages takes a list of brew package names for installation.
func (b BrewBottles) InstallPackages(packages []string) error {
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

// UpdatePackages updates all currently installed brew packages.
func (b BrewBottles) UpdatePackages() error {
	logrus.Info("Upgrading brew packages")
	_, err := b.Commander(brewExe, "upgrade")
	if err != nil {
		logrus.Error("Failed update brew bottles:", err)
		return err
	}
	return nil
}
