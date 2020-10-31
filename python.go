package main

import (
	"strings"

	"github.com/sirupsen/logrus"
)
var (
	pips    = []string{"autopep8", "pylint", "notInstalledPip"}


	python_exe  = "/usr/local/bin/python3"
	python_args = []string{"-m", "pip", "freeze"}
)

type python struct {
	packages []string
	commander Commander
}

func (p python) getMissingPackages() ([]string, error) {
	stdout, err := p.commander.Output(python_exe, python_args...)
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
	for _, bottle := range p.packages {
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
