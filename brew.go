package main

import (
	"strings"

	"github.com/sirupsen/logrus"
)

var (
	bottles = []string{"awscli", "ctags", "notInstalledBottle"}

	brewExe = "brew"
)

type brew struct {
	packages  []string
	commander commander
}

func (b brew) getMissingPackages() ([]string, error) {
	stdout, err := b.commander(brewExe, "list")
	if err != nil {
		return nil, err
	}
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

func (b brew) installPackages(packages []string) error {
	logrus.Info("Installing brew packages:", packages)
	brewArgs := append([]string{"install"}, packages...)
	_, err := b.commander(brewExe, brewArgs...)
	if err != nil {
		logrus.Error("Failed installing brew packages:", err)
		return err
	}
	return nil
}
