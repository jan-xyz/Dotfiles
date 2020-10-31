package main

import (
	"github.com/sirupsen/logrus"
)

var (
	npmExe = "npm"
)

type npm struct {
	packages  []string
	commander commander
}

func (b npm) getMissingPackages() ([]string, error) {
	missingBottles := []string{}
	for _, p := range b.packages {
		_, err := b.commander(npmExe, "ls", "--global", p)
		if err != nil {
			missingBottles = append(missingBottles, p)
		}
	}

	return missingBottles, nil
}

func (b npm) installPackages(packages []string) error {
	if len(packages) == 0 {
		logrus.Info("no npm packages to install")
		return nil
	}
	logrus.Info("Installing vscode extensions:", packages)
	args := append([]string{"install", "--global"}, packages...)
	_, err := b.commander(npmExe, args...)
	if err != nil {
		logrus.Error("Failed installing npm packages:", err)
	}
	return nil
}
