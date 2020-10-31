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
	bottles := viper.GetStringSlice("homebrew.bottles")
	casks := viper.GetStringSlice("homebrew.casks")
	taps := viper.GetStringSlice("homebrew.taps")
	vscodeExt := viper.GetStringSlice("vscode.extensions")
	npmPackages := viper.GetStringSlice("npm.packages")

	handlers := []packageHandler{
		brewTaps{packages: taps, commander: execCommander},
		brewBottles{packages: bottles, commander: execCommander},
		brewCasks{packages: casks, commander: execCommander},
		python{packages: pythonPackages, commander: execCommander},
		vscode{packages: vscodeExt, commander: execCommander},
		npm{packages: npmPackages, commander: execCommander},
	}

	for _, handler := range handlers {
		if missingPackages, err := handler.getMissingPackages(); err != nil {
			logrus.WithError(err).Error("cannot get packages")
		} else {
			handler.installPackages(missingPackages)
		}
	}
}
