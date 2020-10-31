package main

import (
	"strings"

	"github.com/sirupsen/logrus"
)

type brewCasks struct {
	packages  []string
	commander commander
}

func (b brewCasks) getMissingPackages() ([]string, error) {
	stdout, err := b.commander(brewExe, "cask", "list")
	if err != nil {
		return nil, err
	}
	logrus.WithField("output", string(stdout)).Debug("homebrew stdout")
	installedBottles := strings.Split(string(stdout), "\n")
	installedMap := map[string]bool{}
	for _, p := range installedBottles {
		installedMap[p] = true
	}

	missingBottles := []string{}
	for _, bottle := range b.packages {
		if ok := installedMap[bottle]; !ok {
			missingBottles = append(missingBottles, bottle)
		}
	}

	return missingBottles, nil
}

func (b brewCasks) installPackages(packages []string) error {
	if len(packages) == 0 {
		logrus.Info("no Hombrew casks to install")
		return nil
	}
	logrus.Info("Installing brew packages:", packages)
	args := append([]string{"cask", "install"}, packages...)
	_, err := b.commander(brewExe, args...)
	if err != nil {
		logrus.Error("Failed installing brew packages:", err)
		return err
	}
	return nil
}
