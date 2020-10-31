package main

import (
	"os/exec"
	"strings"

	"github.com/sirupsen/logrus"
)

var (
	bottles = []string{"awscli", "ctags", "notInstalledBottle"}
	pips    = []string{"autopep8", "pylint", "notInstalledPip"}

	brew_exe  = "brew"
	brew_args = []string{"list"}

	python_exe  = "/usr/local/bin/python3"
	python_args = []string{"-m", "pip", "freeze"}
)

type Commander interface {
	Output(string, ...string) ([]byte, error)
}

type execCommander struct{}

func (c execCommander) Output(command string, args ...string) ([]byte, error) {
	return exec.Command(command, args...).Output()
}

type packageHandler interface {
	getMissingPackages(Commander) ([]string, error)
	installPackages([]string) error
}

var (
	handlers = []packageHandler{
		brew{packages: bottles},
		python{packages: pips},
	}
)

func main() {
	for _, handler := range handlers {
		if missing_packages, err := handler.getMissingPackages(execCommander{}); err != nil {
			logrus.WithError(err).Error("cannot get packages")
		} else {
			handler.installPackages(missing_packages)
		}
	}
}

type brew struct {
	packages []string
}

func (b brew) getMissingPackages(commander Commander) ([]string, error) {
	stdout, err := commander.Output(brew_exe, brew_args...)
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
	logrus.Info(packages)
	return nil
}

type python struct {
	packages []string
}

func (b python) getMissingPackages(commander Commander) ([]string, error) {
	stdout, err := commander.Output(python_exe, python_args...)
	if err != nil {
		return nil, err
	}
	installed_pips := strings.Split(string(stdout), "\n")
	installed_map := map[string]bool{}
	for _, p := range installed_pips {
		name_and_version := strings.Split(p, "==")
		installed_map[name_and_version[0]] = true
	}

	missing_pips := []string{}
	for _, bottle := range b.packages {
		if ok := installed_map[bottle]; !ok {
			missing_pips = append(missing_pips, bottle)
		}
	}

	return missing_pips, nil
}

func (b python) installPackages(packages []string) error {
	logrus.Info(packages)
	return nil
}
