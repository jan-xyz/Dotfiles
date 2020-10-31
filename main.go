package main

import (
	"os/exec"

	"github.com/sirupsen/logrus"
	"github.com/spf13/viper"
)

type commander func(string, ...string) ([]byte, error)

func execCommander(command string, args ...string) ([]byte, error) {
	return exec.Command(command, args...).Output()
}

type packageHandler interface {
	getMissingPackages() ([]string, error)
	installPackages([]string) error
}

func main() {
	viper.SetConfigName("config")
	viper.SetConfigType("toml")

	viper.AddConfigPath(".")
	err := viper.ReadInConfig()
	if err != nil {
		logrus.Fatalf("Fatal error config file: %s \n", err)
	}
	pythonPackages := viper.GetStringSlice("python.packages")
	brewBottles := viper.GetStringSlice("homebrew.bottles")

	handlers := []packageHandler{
		brew{packages: brewBottles, commander: execCommander},
		python{packages: pythonPackages, commander: execCommander},
	}

	for _, handler := range handlers {
		if missingPackages, err := handler.getMissingPackages(); err != nil {
			logrus.WithError(err).Error("cannot get packages")
		} else {
			handler.installPackages(missingPackages)
		}
	}
}
