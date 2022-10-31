// Package julia allows adding custom julia packages.
package julia

import (
	"fmt"
	"strings"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/sirupsen/logrus"
)

var juliaExe = "julia"

// Plugin holds the information for all needed Plugin modules.
type Plugin struct {
	Modules   []string
	Commander dotfiles.Commander
}

// GetMissingPackages returns a list of modules which are configured but not installed.
func (p Plugin) GetMissingPackages() ([]string, error) {
	missingModules := []string{}
	stdout, err := p.Commander(juliaExe, "-e", "import Pkg;Pkg.status()")
	if err != nil {
		return nil, err
	}
	logrus.WithField("output", string(stdout)).Debug("julia stdout")
	installedFormulae := strings.Split(strings.Trim(string(stdout), "\n"), "\n")[1:]
	logrus.WithField("output", installedFormulae).Debug("julia installed modules")
	installedMap := map[string]bool{}
	for _, p := range installedFormulae {
		logrus.WithField("output", p).Debug("processing julia installed module")
		words := strings.Fields(p)
		installedMap[words[1]] = true
	}

	for _, module := range p.Modules {
		if ok := installedMap[module]; !ok {
			missingModules = append(missingModules, module)
		}
	}

	return missingModules, nil
}

// Add takes a list of modules for installation.
func (p Plugin) Add(packages []string) error {
	if len(packages) == 0 {
		logrus.Info("no julia modules to install")
		return nil
	}
	logrus.Info("Installing julia modules:", packages)

	pkgCommand := fmt.Sprintf("import Pkg;Pkg.add.([\"%s\"])", strings.Join(packages[:], "\",\""))

	_, err := p.Commander(juliaExe, "-e", pkgCommand)
	if err != nil {
		logrus.Error("Failed installing julia modules:", err)
	}
	return nil
}

// Update updates all installed Julia modules.
func (p Plugin) Update() error {
	logrus.Info("Upgrading julia modules")
	_, err := p.Commander(juliaExe, "-e", "import Pkg;Pkg.update()")
	if err != nil {
		logrus.Error("Failed update npm packages:", err)
		return err
	}
	return nil
}
