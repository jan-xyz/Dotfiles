package main

import (
	"strings"

	"github.com/sirupsen/logrus"
)

var (
	pythonExe  = "/usr/local/bin/python3"
	pythonArgs = []string{"-m", "pip"}
)

type python struct {
	packages  []string
	commander commander
}

func (p python) getMissingPackages() ([]string, error) {
	args := append(pythonArgs, "freeze")
	stdout, err := p.commander(pythonExe, args...)
	if err != nil {
		return nil, err
	}
	logrus.WithField("output", string(stdout)).Debug("python stdout")
	installedPips := strings.Split(string(stdout), "\n")
	installedMap := map[string]bool{}
	for _, p := range installedPips {
		nameAndVersion := strings.Split(p, "==")
		installedMap[nameAndVersion[0]] = true
	}

	missingPips := []string{}
	for _, bottle := range p.packages {
		if ok := installedMap[bottle]; !ok {
			missingPips = append(missingPips, bottle)
		}
	}

	return missingPips, nil
}

func (p python) installPackages(packages []string) error {
	if len(packages) == 0 {
		logrus.Info("no Python packages to install")
		return nil
	}
	logrus.Info("Installing Python packages:", packages)
	args := append(pythonArgs, "install")
	args = append(args, packages...)
	_, err := p.commander(pythonExe, args...)
	if err != nil {
		logrus.Error("Failed installing Python packages:", err)
		return err
	}
	return nil
}
