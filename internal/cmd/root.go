package cmd

import (
	"fmt"
	"os"
	"os/exec"

	"github.com/jan-xyz/dotfiles/internal/plugins/appstore"
	"github.com/jan-xyz/dotfiles/internal/plugins/brewbottles"
	"github.com/jan-xyz/dotfiles/internal/plugins/brewtaps"
	"github.com/jan-xyz/dotfiles/internal/plugins/golang"
	"github.com/jan-xyz/dotfiles/internal/plugins/julia"
	"github.com/jan-xyz/dotfiles/internal/plugins/npm"
	"github.com/jan-xyz/dotfiles/internal/plugins/python"
	"github.com/jan-xyz/dotfiles/internal/plugins/symlinks"
	"github.com/jan-xyz/dotfiles/internal/plugins/systemprefs"
	"github.com/jan-xyz/dotfiles/internal/plugins/vscode"
	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
)

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

type packagePlugin interface {
	GetMissingPackages() ([]string, error)
	Add([]string) error
	Update() error
}

var plugins = []packagePlugin{}

// initConfig reads in config file and ENV variables if set.
func initConfig() {
	// Use config file from the flag.
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
	var goModules []golang.GoModule
	viper.UnmarshalKey("go.modules", &goModules)
	var links []symlinks.Link
	viper.UnmarshalKey("symlink.links", &links)
	var apps []appstore.App
	viper.UnmarshalKey("mac.apps", &apps)
	appStoreProfile := viper.GetString("mac.profile")
	var preferences []systemprefs.Preference
	viper.UnmarshalKey("mac.preferences", &preferences)

	plugins = []packagePlugin{
		// run brew first. The others rely on it
		brewtaps.Plugin{Taps: taps, Commander: execCommander},
		brewbottles.Plugin{Bottles: bottles, Commander: execCommander},
		appstore.Plugin{Apps: apps, Profile: appStoreProfile, Commander: execCommander},
		python.Python{Packages: pythonPackages, Commander: execCommander},
		vscode.Plugin{Extensions: vscodeExt, Commander: execCommander},
		npm.Plugin{Packages: npmPackages, Commander: execCommander},
		golang.Plugin{Modules: goModules, Commander: execCommander},
		systemprefs.Plugin{Preferences: preferences, Commander: execCommander},
		symlinks.Plugin{Links: links, Commander: execCommander},
		julia.Plugin{Modules: juliaModules, Commander: execCommander},
	}
}
