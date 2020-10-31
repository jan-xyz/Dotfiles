package main

import (
	"strings"

	"github.com/sirupsen/logrus"
)

type brewTaps struct {
	packages  []string
	commander commander
}

func (b brewTaps) getMissingPackages() ([]string, error) {
	stdout, err := b.commander(brewExe, "tap")
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

func (b brewTaps) installPackages(packages []string) error {
	if len(packages) == 0 {
		logrus.Info("no Hombrew taps to install")
		return nil
	}
	logrus.Info("Installing brew packages:", packages)
	brewArgs := append([]string{"tap"}, packages...)
	_, err := b.commander(brewExe, brewArgs...)
	if err != nil {
		logrus.Error("Failed installing brew packages:", err)
		return err
	}
	return nil
}
