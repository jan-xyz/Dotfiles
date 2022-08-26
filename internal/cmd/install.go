package cmd

import (
	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
)

// installCmd represents the install command
var installCmd = &cobra.Command{
	Use:   "install",
	Short: "Install dotfiles packages",
	Run: func(_ *cobra.Command, _ []string) {
		for _, handler := range plugins {
			if missingPackages, err := handler.GetMissingPackages(); err != nil {
				logrus.WithError(err).Error("cannot get packages")
			} else {
				handler.Add(missingPackages)
			}
		}
	},
}
