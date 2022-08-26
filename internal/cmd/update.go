package cmd

import (
	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
)

// updateCmd represents the update command
var updateCmd = &cobra.Command{
	Use:   "update",
	Short: "update dotfiles packages",
	Run: func(_ *cobra.Command, _ []string) {
		for _, handler := range handlers {
			if err := handler.Update(); err != nil {
				logrus.WithError(err).Error("cannot update packages")
			}
		}
	},
}
