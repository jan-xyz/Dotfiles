package dotfiles

import (
	"fmt"
	"strings"

	"github.com/sirupsen/logrus"
)

var juliaExe = "julia"

// NPM holds the information for all needed NPM packages.
type Julia struct {
	Modules   []string
	Commander Commander
}

// GetMissingPackages returns a list of packages which are configured but not installed.
func (b Julia) GetMissingPackages() ([]string, error) {
	missingBottles := []string{}
	stdout, err := b.Commander(juliaExe, "-e", "import Pkg;Pkg.status()")
	if err != nil {
		return nil, err
	}
	logrus.WithField("output", string(stdout)).Debug("julia stdout")
	installedFormulae := strings.Split(strings.Trim(string(stdout), "\n"), "\n")[1:]
	logrus.WithField("output", installedFormulae).Debug("julia installed formulae")
	installedMap := map[string]bool{}
	for _, p := range installedFormulae {
		logrus.WithField("output", p).Error("julia installed formulae")
		words := strings.Fields(p)
		installedMap[words[1]] = true
	}

	for _, bottle := range b.Modules {
		if ok := installedMap[bottle]; !ok {
			missingBottles = append(missingBottles, bottle)
		}
	}

	return missingBottles, nil
}

// InstallPackages takes a list of packages for installation.
func (b Julia) InstallPackages(packages []string) error {
	if len(packages) == 0 {
		logrus.Info("no julia modules to install")
		return nil
	}
	logrus.Info("Installing julia modules:", packages)

	pkgCommand := fmt.Sprintf("import Pkg;Pkg.add.([\"%s\"])", strings.Join(packages[:], "\",\""))

	_, err := b.Commander(juliaExe, "-e", pkgCommand)
	if err != nil {
		logrus.Error("Failed installing julia modules:", err)
	}
	return nil
}

// UpdatePackages is currently not implemented.
func (b Julia) UpdatePackages() error {
	logrus.Info("Upgrading julia modules")
	_, err := b.Commander(juliaExe, "-e", "import Pkg;Pkg.update()")
	if err != nil {
		logrus.Error("Failed update npm packages:", err)
		return err
	}
	return nil
}
