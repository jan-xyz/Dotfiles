package main

import (
	"os/exec"

	"github.com/sirupsen/logrus"
)

type Commander interface {
	Output(string, ...string) ([]byte, error)
}

type execCommander struct{}

func (c execCommander) Output(command string, args ...string) ([]byte, error) {
	return exec.Command(command, args...).Output()
}

type packageHandler interface {
	getMissingPackages() ([]string, error)
	installPackages([]string) error
}

var (
	handlers = []packageHandler{
		brew{packages: bottles, commander: execCommander{}},
		python{packages: pips, commander: execCommander{}},
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
