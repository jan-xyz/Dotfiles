// Package brewtaps is the plugin to interface with brew to add custom taps.
package brewtaps

import (
	"strings"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/sirupsen/logrus"
)

var brewExe = "brew"

// Plugin holds the configuration for homebrew taps.
type Plugin struct {
	Taps      []string
	Commander dotfiles.Commander
}

// GetMissingPackages returns a list of homebrew taps which are configured
// but not currently tapped.
func (b Plugin) GetMissingPackages() ([]string, error) {
	stdout, err := b.Commander(brewExe, "tap")
	if err != nil {
		return nil, err
	}
	logrus.WithField("output", string(stdout)).Debug("homebrew stdout")
	installedTaps := strings.Split(string(stdout), "\n")
	installedMap := map[string]bool{}
	for _, p := range installedTaps {
		installedMap[p] = true
	}

	missingTaps := []string{}
	for _, tap := range b.Taps {
		if ok := installedMap[tap]; !ok {
			missingTaps = append(missingTaps, tap)
		}
	}

	return missingTaps, nil
}

// Add takes a list of taps to tap these.
func (b Plugin) Add(taps []string) error {
	if len(taps) == 0 {
		logrus.Info("no Hombrew taps to install")
		return nil
	}
	logrus.Info("Installing brew packages:", taps)
	brewArgs := append([]string{"tap"}, taps...)
	_, err := b.Commander(brewExe, brewArgs...)
	if err != nil {
		logrus.Error("Failed installing brew packages:", err)
		return err
	}
	return nil
}

// Update for Homebrew taps is currently not implemented.
func (b Plugin) Update() error {
	return nil
}
