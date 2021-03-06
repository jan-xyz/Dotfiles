package dotfiles

import (
	"os"
	"path/filepath"
	"strings"

	"github.com/sirupsen/logrus"
)

// Preference holds the information for a MacOS system preference.
type Preference struct {
	Name  string
	Type  string
	Value string
}

// SystemPreferences holds the information for automatically setting system
// preferences.
type SystemPreferences struct {
	Preferences []Preference
	Commander   Commander
}

// GetMissingPackages returns a list of system preferences which drifted from
// the configuration. Environment variables get expanded before checking drift.
func (s SystemPreferences) GetMissingPackages() ([]string, error) {
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

// InstallPackages takes a list of preferences for setting up. Environemnt variables get expanded before setting value.
func (s SystemPreferences) InstallPackages(preferences []string) error {
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

// UpdatePackages is not implemented.
func (s SystemPreferences) UpdatePackages() error {
	return nil
}
