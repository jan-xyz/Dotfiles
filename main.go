package main

import (
	"fmt"
	"os"
	"os/exec"
	"strings"
)

var (
	bottles = []string{"awscli", "ctags", "notInstalledBottle"}
	pips    = []string{"autopep8", "pylint", "notInstalledPip"}
)

func main() {
	installed_bottles := getInstalledBottles()
	for _, bottle := range bottles {
		if _, ok := installed_bottles[bottle]; !ok {
			fmt.Println("installing", bottle)
		}
	}
}

func getInstalledBottles() map[string]bool {
	cmd := exec.Command("brew", "list")
	stdout, err := cmd.Output()
	if err != nil {
		os.Exit(1)
	}
	installed_packages := strings.Split(string(stdout), "\n")
	installed_map := map[string]bool{}
	for _, p := range installed_packages {
		installed_map[p] = true
	}

	return installed_map
}
