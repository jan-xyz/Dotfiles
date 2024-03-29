// Package python to install python packages globally
package python

import (
	"strings"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/sirupsen/logrus"
)

var (
	pythonExe  = "/opt/homebrew/bin/python3"
	pythonArgs = []string{"-m", "pip"}
)

// Plugin holds the information to install python packages
type Plugin struct {
	Packages  []string
	Commander dotfiles.Commander
}

// GetMissingPackages returns a list of Python packages which are configured
// but not installed.
func (p Plugin) GetMissingPackages() ([]string, error) {
	args := append(pythonArgs, "freeze")
	stdout, err := p.Commander(pythonExe, args...)
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
	for _, bottle := range p.Packages {
		if ok := installedMap[bottle]; !ok {
			missingPips = append(missingPips, bottle)
		}
	}

	return missingPips, nil
}

// Add takes a list of packages for installation.
func (p Plugin) Add(packages []string) error {
	if len(packages) == 0 {
		logrus.Info("no Python packages to install")
		return nil
	}
	logrus.Info("Installing Python packages:", packages)
	args := append(pythonArgs, "install")
	args = append(args, packages...)
	_, err := p.Commander(pythonExe, args...)
	if err != nil {
		logrus.Error("Failed installing Python packages:", err)
		return err
	}
	return nil
}

// Update is currently not implemented.
func (p Plugin) Update() error {
	logrus.Info("Upgrading Python packages")
	args := append(pythonArgs, "install", "--upgrade")
	args = append(args, p.Packages...)
	_, err := p.Commander(pythonExe, args...)
	if err != nil {
		logrus.Error("Failed installing Python packages:", err)
		return err
	}
	return nil
}
