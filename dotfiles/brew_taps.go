package dotfiles

import (
	"strings"

	"github.com/sirupsen/logrus"
)

type BrewTaps struct {
	Packages  []string
	Commander Commander
}

func (b BrewTaps) GetMissingPackages() ([]string, error) {
	stdout, err := b.Commander(brewExe, "tap")
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
	for _, bottle := range b.Packages {
		if ok := installedMap[bottle]; !ok {
			missingBottles = append(missingBottles, bottle)
		}
	}

	return missingBottles, nil
}

func (b BrewTaps) InstallPackages(packages []string) error {
	if len(packages) == 0 {
		logrus.Info("no Hombrew taps to install")
		return nil
	}
	logrus.Info("Installing brew packages:", packages)
	brewArgs := append([]string{"tap"}, packages...)
	_, err := b.Commander(brewExe, brewArgs...)
	if err != nil {
		logrus.Error("Failed installing brew packages:", err)
		return err
	}
	return nil
}

func (b BrewTaps) UpdatePackages() error {
	logrus.Debug("Brew tap upgrade called.")
	return nil
}
