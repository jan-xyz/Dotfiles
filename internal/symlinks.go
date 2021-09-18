package dotfiles

import (
	"errors"
	"os"
	"path/filepath"
	"strings"

	"github.com/sirupsen/logrus"
)

var errSymLinksFailed = errors.New("failed configuring symlink")

// Link holds the information for a single symbolic link
type Link struct {
	SourceFile string
	LinkName   string
}

// Symlink holds the information to automatically create a list of symbolic
// links.
type Symlink struct {
	Links     []Link
	Commander Commander
}

// GetMissingPackages returns a list of sym links which are configured but not
// created.
func (s Symlink) GetMissingPackages() ([]string, error) {
	missing := []string{}
	for _, p := range s.Links {
		sourceFile, err := s.Commander("readlink", os.ExpandEnv(p.LinkName))
		if err != nil || strings.TrimSpace(string(sourceFile)) != os.ExpandEnv(p.SourceFile) {
			missing = append(missing, p.LinkName)
		}
	}
	return missing, nil
}

// Add takes a list of links for creation.
func (s Symlink) Add(links []string) error {
	if len(links) == 0 {
		logrus.Info("no symlinks to configure")
		return nil
	}
	logrus.Info("Configuring symlinks:", links)
	symLinksMap := map[string]string{}
	for _, l := range s.Links {
		symLinksMap[l.LinkName] = l.SourceFile
	}
	errs := []error{}
	for _, linkName := range links {
		if sourceFile, ok := symLinksMap[linkName]; !ok {
			logrus.Error("trying to congifure symlink which is not configured.")
		} else {
			_, err := s.Commander("mkdir", "-p", filepath.Dir(os.ExpandEnv(linkName)))
			if err != nil {
				logrus.Error("Failed creating parent directory:", err)
				errs = append(errs, err)
				continue
			}
			_, err = s.Commander("ln", "-sf", os.ExpandEnv(sourceFile), os.ExpandEnv(linkName))
			if err != nil {
				logrus.Error("Failed configuring symlink:", err)
				errs = append(errs, err)
			}
		}
	}
	if len(errs) != 0 {
		return errSymLinksFailed
	}
	return nil
}

// Update is not implemented.
func (s Symlink) Update() error {
	return nil
}
