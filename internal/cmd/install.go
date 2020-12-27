package cmd

import (
	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
)

// installCmd represents the install command
var installCmd = &cobra.Command{
	Use:   "install",
	Short: "Install dotfiles packages",
	Run: func(cmd *cobra.Command, args []string) {
		for _, handler := range handlers {
			if missingPackages, err := handler.GetMissingPackages(); err != nil {
				logrus.WithError(err).Error("cannot get packages")
			} else {
				handler.InstallPackages(missingPackages)
			}
		}
	},
}

func init() {
	rootCmd.AddCommand(installCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// installCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// installCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
