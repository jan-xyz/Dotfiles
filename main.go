package main

import (
	"fmt"
	"os/exec"
	"strings"

	"github.com/sirupsen/logrus"
)

var (
	bottles = []string{"awscli", "ctags", "notInstalledBottle"}
	pips    = []string{"autopep8", "pylint", "notInstalledPip"}

	brew_exe  = "brew"
	brew_args = []string{"list"}

	python_exe  = "/usr/local/bin/python3"
	python_args = []string{"-m", "pip", "freeze"}
)

func main() {
	installed_bottles, err := getInstalledBottles()
	if err != nil {
		logrus.WithError(err).Error("cannot get brew bottles")
	} else {
		for _, bottle := range bottles {
			if _, ok := installed_bottles[bottle]; !ok {
				fmt.Println("installing", bottle)
			} else {
				fmt.Println("already installed", bottle)
			}
		}
	}
	installed_pips, err := getInstalledPips()
	if err != nil {
		logrus.WithError(err).Error("cannot get python packages")
	} else {
		for _, pip := range pips {
			if _, ok := installed_pips[pip]; !ok {
				fmt.Println("installing", pip)
			} else {
				fmt.Println("already installed", pip)
			}
		}
	}
}

func getInstalledBottles() (map[string]bool, error) {
	cmd := exec.Command(brew_exe, brew_args...)
	stdout, err := cmd.Output()
	if err != nil {
		return nil, err
	}
	installed_packages := strings.Split(string(stdout), "\n")
	installed_map := map[string]bool{}
	for _, p := range installed_packages {
		installed_map[p] = true
	}

	return installed_map, nil
}

func getInstalledPips() (map[string]bool, error) {
	cmd := exec.Command(python_exe, python_args...)
	stdout, err := cmd.Output()
	if err != nil {
		return nil, err
	}
	installed_packages := strings.Split(string(stdout), "\n")
	installed_map := map[string]bool{}
	for _, p := range installed_packages {
		name_and_version := strings.Split(p, "==")
		installed_map[name_and_version[0]] = true
	}

	return installed_map, nil
}
