package dotfiles

import (
	"strings"

	"github.com/sirupsen/logrus"
)

var (
	brewExe = "brew"
)

type BrewBottles struct {
	Packages  []string
	Commander Commander
}

func (b BrewBottles) GetMissingPackages() ([]string, error) {
	stdout, err := b.Commander(brewExe, "list")
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
