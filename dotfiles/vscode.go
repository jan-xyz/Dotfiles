package dotfiles

import (
	"strings"

	"github.com/sirupsen/logrus"
)

var (
	vscodeExe = "code"
)

// VSCode holds the information to automatically install VSCode extensions.
type VSCode struct {
	Extensions  []string
	Commander Commander
}

// GetMissingPackages returns a list of VSCode extensions which are configured
// but not installed.
func (v VSCode) GetMissingPackages() ([]string, error) {
	stdout, err := v.Commander(vscodeExe, "--list-extensions")
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
	for _, bottle := range v.Extensions {
		if ok := installedMap[bottle]; !ok {
			missingBottles = append(missingBottles, bottle)
		}
	}

	return missingBottles, nil
}

// InstallPackages takes a list of extensions for installation.
func (v VSCode) InstallPackages(extensions []string) error {
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

// UpdatePackages is not implemented.
func (v VSCode) UpdatePackages() error {
	return nil
}
