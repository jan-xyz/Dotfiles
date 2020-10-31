package main

import (
	"strings"

	"github.com/sirupsen/logrus"
)

var (
	bottles = []string{"awscli", "ctags", "notInstalledBottle"}

	brew_exe = "brew"
)

type brew struct {
	packages  []string
	commander Commander
}

func (b brew) getMissingPackages() ([]string, error) {
	stdout, err := b.commander(brew_exe, "list")
	if err != nil {
		return nil, err
	}
	installed_bottles := strings.Split(string(stdout), "\n")
	installed_map := map[string]bool{}
	for _, p := range installed_bottles {
		installed_map[p] = true
	}

	missing_bottles := []string{}
	for _, bottle := range b.packages {
		if ok := installed_map[bottle]; !ok {
			missing_bottles = append(missing_bottles, bottle)
		}
	}

	return missing_bottles, nil
}

func (b brew) installPackages(packages []string) error {
	logrus.Info("Installing brew packages:", packages)
	brew_args := append([]string{"install"}, packages...)
	_, err := b.commander(brew_exe, brew_args...)
	if err != nil {
		logrus.Error("Failed installing brew packages:", err)
		return err
	}
	return nil
}
