// Package npm to install npm packages globally
package npm

import (
	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/sirupsen/logrus"
)

var npmExe = "npm"

// Plugin holds the information for all needed Plugin packages.
type Plugin struct {
	Packages  []string
	Commander dotfiles.Commander
}

// GetMissingPackages returns a list of packages which are configured but not installed.
func (b Plugin) GetMissingPackages() ([]string, error) {
	missingBottles := []string{}
	for _, p := range b.Packages {
		_, err := b.Commander(npmExe, "ls", "--global", p)
		if err != nil {
			missingBottles = append(missingBottles, p)
		}
	}

	return missingBottles, nil
}

// Add takes a list of packages for installation.
func (b Plugin) Add(packages []string) error {
	if len(packages) == 0 {
		logrus.Info("no npm packages to install")
		return nil
	}
	logrus.Info("Installing npm packages:", packages)
	args := append([]string{"install", "--global"}, packages...)
	_, err := b.Commander(npmExe, args...)
	if err != nil {
		logrus.Error("Failed installing npm packages:", err)
	}
	return nil
}

// Update is currently not implemented.
func (b Plugin) Update() error {
	logrus.Info("Upgrading npm packages")
	_, err := b.Commander(npmExe, "update", "--global")
	if err != nil {
		logrus.Error("Failed update npm packages:", err)
		return err
	}
	return nil
}
