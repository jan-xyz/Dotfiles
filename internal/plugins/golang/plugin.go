// Package golang is the plugin to install go tools.
package golang

import (
	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/sirupsen/logrus"
)

var goExe = "go"

// GoModule holds the configuration for a go module
type GoModule struct {
	Exe  string
	Path string
}

// Plugin holds the information to automatically install go modules.
type Plugin struct {
	Modules   []GoModule
	Commander dotfiles.Commander
}

// GetMissingPackages returns a list of configured but not installed go modules.
func (g Plugin) GetMissingPackages() ([]string, error) {
	missing := []string{}
	for _, p := range g.Modules {
		_, err := g.Commander("command", "-v", p.Exe)
		if err != nil {
			logrus.WithField("module", p.Exe).Debug("Adding module to missing package")
			missing = append(missing, p.Exe)
		}
	}

	return missing, nil
}

// Add takes a list of go modules for installation.
func (g Plugin) Add(modules []string) error {
	if len(modules) == 0 {
		logrus.Info("no go modules to install")
		return nil
	}
	logrus.Info("Installing go modules:", modules)
	goModulesMap := map[string]string{}
	for _, p := range g.Modules {
		goModulesMap[p.Exe] = p.Path
	}

	args := []string{"get"}
	for _, p := range modules {
		if path, ok := goModulesMap[p]; !ok {
			logrus.Error("trying to install go Module which is not configured")
		} else {
			args = append(args, path)
		}
	}

	_, err := g.Commander(goExe, args...)
	if err != nil {
		logrus.Error("Failed installing go modules:", err)
		return err
	}
	return nil
}

// Update updates all currently configured go packages.
func (g Plugin) Update() error {
	logrus.Info("Upgrading go modules:", g.Modules)

	args := []string{"get", "-u"}
	for _, p := range g.Modules {
		args = append(args, p.Path)
	}

	_, err := g.Commander(goExe, args...)
	if err != nil {
		logrus.Error("Failed installing go modules:", err)
		return err
	}
	return nil
}
