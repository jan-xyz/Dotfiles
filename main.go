package main

import (
	"os/exec"

	"github.com/sirupsen/logrus"
)

type Commander func(string, ...string) ([]byte, error)

func execCommander(command string, args ...string) ([]byte, error) {
	return exec.Command(command, args...).Output()
}

type packageHandler interface {
	getMissingPackages() ([]string, error)
	installPackages([]string) error
}

var (
	handlers = []packageHandler{
		brew{packages: bottles, commander: execCommander},
		python{packages: pips, commander: execCommander},
	}
)

func main() {
	for _, handler := range handlers {
		if missing_packages, err := handler.getMissingPackages(); err != nil {
			logrus.WithError(err).Error("cannot get packages")
		} else {
			handler.installPackages(missing_packages)
		}
	}
}
