package main

import (
	"github.com/sirupsen/logrus"
)

var goExe = "go"

type goModule struct {
	Exe  string
	Path string
}

type golang struct {
	packages  []goModule
	commander commander
}

func (b golang) getMissingPackages() ([]string, error) {
	missing := []string{}
	for _, p := range b.packages {
		_, err := b.commander("command", "-v", p.Exe)
		if err != nil {
			logrus.WithField("module", p.Exe).Debug("Adding module to missing package")
			missing = append(missing, p.Exe)
		}
	}

	return missing, nil
}

func (b golang) installPackages(packages []string) error {
	if len(packages) == 0 {
		logrus.Info("no go modules to install")
		return nil
	}
	logrus.Info("Installing go modules:", packages)
	goModulesMap := map[string]string{}
	for _, p := range b.packages {
		goModulesMap[p.Exe] = p.Path
	}

	args := []string{"get"}
	for _, p := range packages {
		if path, ok := goModulesMap[p]; !ok {
			logrus.Error("trying to install go Module which is not configured")
		} else {
			args = append(args, path)
		}
	}

	_, err := b.commander(goExe, args...)
	if err != nil {
		logrus.Error("Failed installing go modules:", err)
		return err
	}
	return nil
}
