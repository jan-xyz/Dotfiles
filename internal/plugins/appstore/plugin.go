// Package appstore is the plugin to interface with the apple appstore and install applications on it.
package appstore

import (
	"strings"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/sirupsen/logrus"
)

var masExe = "mas"

// App holds the configuration of an application from the Mac App Store.
type App struct {
	Name string
	ID   string
}

// Plugin holds the configuration to automatically install a collection of
// apps and the associated configration.
type Plugin struct {
	Apps      []App
	Profile   string
	Commander dotfiles.Commander
}

// GetMissingPackages returns a list of application IDs which are configured
// but not yet installed on the system. It returns an error if the current
// app store profile does not match the configured profile.
func (a Plugin) GetMissingPackages() ([]string, error) {
	cmd := "mas list | awk '{print $1;}'"
	stdout, err := a.Commander("bash", "-c", cmd)
	if err != nil {
		return nil, err
	}
	logrus.WithField("output", string(stdout)).Debug("mas stdout")
	installedApps := strings.Split(string(stdout), "\n")
	installedMap := map[string]bool{}
	for _, p := range installedApps {
		installedMap[p] = true
	}

	missingApps := []string{}
	for _, app := range a.Apps {
		if ok := installedMap[app.ID]; !ok {
			missingApps = append(missingApps, app.ID)
		}
	}

	return missingApps, nil
}

// Add takes a list of app IDs and tries to install these.
func (a Plugin) Add(apps []string) error {
	if len(apps) == 0 {
		logrus.Info("no app to install")
		return nil
	}
	configuredApps := map[string]string{}
	for _, app := range a.Apps {
		configuredApps[app.ID] = app.Name
	}
	appNames := []string{}
	for _, app := range apps {
		if name, ok := configuredApps[app]; ok {
			appNames = append(appNames, name)
		}
	}
	logrus.Infof("Installing apps: %s", strings.Join(appNames, ","))
	args := append([]string{"install"}, apps...)
	_, err := a.Commander(masExe, args...)
	if err != nil {
		logrus.Error("Failed installing apps:", err)
		return err
	}
	return nil
}

// Update upgrades all currently installed packages.
func (a Plugin) Update() error {
	logrus.Info("Upgrading apps")
	_, err := a.Commander(masExe, "upgrade")
	if err != nil {
		logrus.Error("Failed update apps:", err)
		return err
	}
	return nil
}
