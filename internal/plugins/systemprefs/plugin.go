// Package systemprefs allows managing system preferences
// Find out more here: https://macos-defaults.com/
package systemprefs

import (
	"os"
	"path/filepath"
	"strings"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/sirupsen/logrus"
)

// Preference holds the information for a MacOS system preference.
type Preference struct {
	Name  string
	Type  string
	Value string
}

// Plugin holds the information for automatically setting system
// preferences.
type Plugin struct {
	Preferences []Preference
	Commander   dotfiles.Commander
}

// GetMissingPackages returns a list of system preferences which drifted from
// the configuration. Environment variables get expanded before checking drift.
func (s Plugin) GetMissingPackages() ([]string, error) {
	drift := []string{}
	for _, preference := range s.Preferences {
		pref := filepath.Ext(preference.Name)[1:]
		ns := preference.Name[0 : len(preference.Name)-len(pref)-1]
		expectedValue := os.ExpandEnv(preference.Value)
		if actualValue, err := s.Commander("defaults", "read", ns, pref); err != nil || strings.TrimSpace(string(actualValue)) != expectedValue {
			logrus.WithField("want", expectedValue).WithField("got", string(actualValue)).Error(preference.Name)
			drift = append(drift, string(preference.Name))
		}
	}

	return drift, nil
}

// Add takes a list of preferences for setting up. Environemnt variables get expanded before setting value.
func (s Plugin) Add(preferences []string) error {
	if len(preferences) == 0 {
		logrus.Info("no prefrences to set")
		return nil
	}
	configuredPrefs := map[string]Preference{}
	for _, p := range s.Preferences {
		configuredPrefs[p.Name] = p
	}
	logrus.Infof("setting preferences: %s", strings.Join(preferences, ","))
	for _, preferenceName := range preferences {
		pref := filepath.Ext(preferenceName)[1:]
		ns := preferenceName[0 : len(preferenceName)-len(pref)-1]
		value := os.ExpandEnv(configuredPrefs[preferenceName].Value)
		valueType := configuredPrefs[preferenceName].Type

		_, err := s.Commander("defaults", "write", ns, pref, "-"+valueType, value)
		if err != nil {
			return err
		}

	}
	// TODO: restart the affected applications [#5]
	return nil
}

// Update is not implemented.
func (s Plugin) Update() error {
	return nil
}
