// Package vscode allows managing vscode extensions
package vscode

import (
	"strings"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/sirupsen/logrus"
)

var vscodeExe = "code"

// Plugin holds the information to automatically install Plugin extensions.
type Plugin struct {
	Extensions []string
	Commander  dotfiles.Commander
}

// GetMissingPackages returns a list of VSCode extensions which are configured
// but not installed.
func (v Plugin) GetMissingPackages() ([]string, error) {
	stdout, err := v.Commander(vscodeExe, "--list-extensions")
	if err != nil {
		return nil, err
	}
	logrus.WithField("output", string(stdout)).Debug("vscode stdout")
	installedBottles := strings.Split(strings.ToLower(string(stdout)), "\n")
	installedMap := map[string]bool{}
	for _, p := range installedBottles {
		installedMap[p] = true
	}

	missingBottles := []string{}
	for _, bottle := range v.Extensions {
		if ok := installedMap[strings.ToLower(bottle)]; !ok {
			missingBottles = append(missingBottles, bottle)
		}
	}

	return missingBottles, nil
}

// Add takes a list of extensions for installation.
func (v Plugin) Add(extensions []string) error {
	if len(extensions) == 0 {
		logrus.Info("no vscode extensions to install")
		return nil
	}
	logrus.Info("Installing vscode extensions:", extensions)
	for _, p := range extensions {
		_, err := v.Commander(vscodeExe, "--install-extension", p)
		if err != nil {
			logrus.Error("Failed installing vscode extension:", err)
		}
	}
	return nil
}

// Update is not implemented.
func (v Plugin) Update() error {
	return nil
}
