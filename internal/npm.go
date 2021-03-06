package dotfiles

import (
	"github.com/sirupsen/logrus"
)

var npmExe = "npm"

// NPM holds the information for all needed NPM packages.
type NPM struct {
	Packages  []string
	Commander Commander
}

// GetMissingPackages returns a list of packages which are configured but not installed.
func (b NPM) GetMissingPackages() ([]string, error) {
	missingBottles := []string{}
	for _, p := range b.Packages {
		_, err := b.Commander(npmExe, "ls", "--global", p)
		if err != nil {
			missingBottles = append(missingBottles, p)
		}
	}

	return missingBottles, nil
}

// InstallPackages takes a list of packages for installation.
func (b NPM) InstallPackages(packages []string) error {
	if len(packages) == 0 {
		logrus.Info("no npm packages to install")
		return nil
	}
	logrus.Info("Installing vscode extensions:", packages)
	args := append([]string{"install", "--global"}, packages...)
	_, err := b.Commander(npmExe, args...)
	if err != nil {
		logrus.Error("Failed installing npm packages:", err)
	}
	return nil
}

// UpdatePackages is currently not implemented.
func (b NPM) UpdatePackages() error {
	logrus.Info("Upgrading npm packages")
	_, err := b.Commander(npmExe, "update", "--global")
	if err != nil {
		logrus.Error("Failed update npm packages:", err)
		return err
	}
	return nil
}
