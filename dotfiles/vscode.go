package dotfiles

import (
	"strings"

	"github.com/sirupsen/logrus"
)

var (
	vscodeExe = "code"
)

type VSCode struct {
	Packages  []string
	Commander Commander
}

func (b VSCode) GetMissingPackages() ([]string, error) {
	stdout, err := b.Commander(vscodeExe, "--list-extensions")
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

func (b VSCode) InstallPackages(packages []string) error {
	if len(packages) == 0 {
		logrus.Info("no vscode extensions to install")
		return nil
	}
	logrus.Info("Installing vscode extensions:", packages)
	for _, p := range packages {
		_, err := b.Commander(vscodeExe, "--install-extension", p)
		if err != nil {
			logrus.Error("Failed installing vscode extension:", err)
		}
	}
	return nil
}
