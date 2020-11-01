package dotfiles

import (
	"github.com/sirupsen/logrus"
)

var (
	npmExe = "npm"
)

type NPM struct {
	Packages  []string
	Commander Commander
}

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

func (b NPM) UpdatePackages() error {
	return nil
}
