package cmd

import (
	"fmt"
	"os"
	"os/exec"

	"github.com/jan-xyz/dotfiles/dotfiles"
	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"

	"github.com/spf13/viper"
)

var cfgFile string

// rootCmd represents the base command when called without any subcommands
var rootCmd = &cobra.Command{
	Use:   "dotfiles",
	Short: "A brief description of your application",
	Long: `A longer description that spans multiple lines and likely contains
examples and usage of using your application. For example:

Cobra is a CLI library for Go that empowers applications.
This application is a tool to generate the needed files
to quickly create a Cobra application.`,
	// Uncomment the following line if your bare application
	// has an action associated with it:
	//	Run: func(cmd *cobra.Command, args []string) { },
}

// Execute adds all child commands to the root command and sets flags appropriately.
// This is called by main.main(). It only needs to happen once to the rootCmd.
func Execute() {
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}

func init() {
	cobra.OnInitialize(initConfig)
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
	InstallPackages([]string) error
	UpdatePackages() error
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
		dotfiles.BrewBottles{Packages: bottles, Commander: execCommander},
		dotfiles.Python{Packages: pythonPackages, Commander: execCommander},
		dotfiles.VSCode{Extensions: vscodeExt, Commander: execCommander},
		dotfiles.NPM{Packages: npmPackages, Commander: execCommander},
		dotfiles.Go{Packages: goModules, Commander: execCommander},
		dotfiles.AppStore{Apps: apps, Profile: appStoreProfile, Commander: execCommander},
		dotfiles.SystemPreferences{Preferences: preferences, Commander: execCommander},
		dotfiles.Symlink{Links: symlinks, Commander: execCommander},
	}

}
