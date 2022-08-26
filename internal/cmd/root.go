package cmd

import (
	"fmt"
	"os"
	"os/exec"

	dotfiles "github.com/jan-xyz/dotfiles/internal"
	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
)

var cfgFile string

// Execute the dotfile application
func Execute() {
	cobra.OnInitialize(initConfig)

	rootCmd := &cobra.Command{
		Use:   "dotfiles",
		Short: "manage your dotfiles",
	}
	rootCmd.AddCommand(updateCmd)
	rootCmd.AddCommand(installCmd)

	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}

func execCommander(command string, args ...string) ([]byte, error) {
	cmd := exec.Command(command, args...)
	cmd.Dir = "/"
	cmd.Env = append(os.Environ(), "GO111MODULE=on")
	b, err := cmd.CombinedOutput()
	if err != nil {
		logrus.Error("output: ", string(b))
		return nil, err
	}
	return b, nil
}

type packageHandler interface {
	GetMissingPackages() ([]string, error)
	Add([]string) error
	Update() error
}

var handlers = []packageHandler{}

// initConfig reads in config file and ENV variables if set.
func initConfig() {
	// Use config file from the flag.
	viper.SetConfigFile(cfgFile)
	viper.SetConfigName("config")
	viper.SetConfigType("toml")

	viper.AddConfigPath("$HOME/Dotfiles/")
	err := viper.ReadInConfig()
	if err != nil {
		logrus.Fatalf("Fatal error config file: %s \n", err)
	}

	pythonPackages := viper.GetStringSlice("python.packages")
	bottles := viper.GetStringSlice("homebrew.bottles")
	taps := viper.GetStringSlice("homebrew.taps")
	vscodeExt := viper.GetStringSlice("vscode.extensions")
	npmPackages := viper.GetStringSlice("npm.packages")
	juliaModules := viper.GetStringSlice("julia.modules")
	var goModules []dotfiles.GoModule
	viper.UnmarshalKey("go.modules", &goModules)
	var symlinks []dotfiles.Link
	viper.UnmarshalKey("symlink.links", &symlinks)
	var apps []dotfiles.App
	viper.UnmarshalKey("mac.apps", &apps)
	appStoreProfile := viper.GetString("mac.profile")
	var preferences []dotfiles.Preference
	viper.UnmarshalKey("mac.preferences", &preferences)

	handlers = []packageHandler{
		dotfiles.BrewTaps{Taps: taps, Commander: execCommander},
		dotfiles.BrewBottles{Bottles: bottles, Commander: execCommander},
		dotfiles.Python{Packages: pythonPackages, Commander: execCommander},
		dotfiles.VSCode{Extensions: vscodeExt, Commander: execCommander},
		dotfiles.NPM{Packages: npmPackages, Commander: execCommander},
		dotfiles.Go{Modules: goModules, Commander: execCommander},
		dotfiles.AppStore{Apps: apps, Profile: appStoreProfile, Commander: execCommander},
		dotfiles.SystemPreferences{Preferences: preferences, Commander: execCommander},
		dotfiles.Symlink{Links: symlinks, Commander: execCommander},
		dotfiles.Julia{Modules: juliaModules, Commander: execCommander},
	}
}
