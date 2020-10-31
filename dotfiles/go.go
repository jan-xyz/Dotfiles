package dotfiles

import (
	"github.com/sirupsen/logrus"
)

var goExe = "go"

type GoModule struct {
	Exe  string
	Path string
}

type Go struct {
	Packages  []GoModule
	Commander Commander
}

func (b Go) GetMissingPackages() ([]string, error) {
	missing := []string{}
	for _, p := range b.Packages {
		_, err := b.Commander("command", "-v", p.Exe)
		if err != nil {
			logrus.WithField("module", p.Exe).Debug("Adding module to missing package")
			missing = append(missing, p.Exe)
		}
	}

	return missing, nil
}

func (b Go) InstallPackages(packages []string) error {
	if len(packages) == 0 {
		logrus.Info("no go modules to install")
		return nil
	}
	logrus.Info("Installing go modules:", packages)
	goModulesMap := map[string]string{}
	for _, p := range b.Packages {
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

	_, err := b.Commander(goExe, args...)
	if err != nil {
		logrus.Error("Failed installing go modules:", err)
		return err
	}
	return nil
}
