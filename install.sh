#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
DOTFILES="$PWD"
BREW=/opt/homebrew/bin/brew

yellow() { printf '\033[0;33m%s\033[0m\n' "$1"; }
green() { printf '\033[0;32m%s\033[0m\n' "$1"; }

yellow "Checking Homebrew"
if [[ ! -x "$BREW" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$("$BREW" shellenv bash)"

yellow "Installing Homebrew packages"
brew bundle --file="$DOTFILES/Brewfile"

yellow "Creating symlinks"
links=(
  "codebook:$HOME/.config/codebook"
  "crush:$HOME/.config/crush"
  "fish:$HOME/.config/fish"
  "fzf:$HOME/.config/fzf"
  "ghostty:$HOME/.config/ghostty"
  "git:$HOME/.config/git"
  "kitty:$HOME/.config/kitty"
  "nvim:$HOME/.config/nvim"
  "starship.toml:$HOME/.config/starship.toml"
  "hammerspoon:$HOME/.hammerspoon"
  "vscode/settings.json:$HOME/Library/Application Support/Code/User/settings.json"
)
for link in "${links[@]}"; do
  source_file="$DOTFILES/${link%%:*}"
  link_name="${link#*:}"
  mkdir -p "$(dirname "$link_name")"
  ln -snf "$source_file" "$link_name"
done

yellow "Installing Go tools"
go install github.com/grafana/jsonnet-language-server@latest
go install github.com/docker/docker-language-server/cmd/docker-language-server@latest

yellow "Setting macOS preferences"
"$DOTFILES/macos.sh"

yellow "Linking Homebrew JDKs for the system Java wrappers"
for jdk in openjdk openjdk@17 openjdk@21; do
  jdk_home="$(brew --prefix)/opt/$jdk/libexec/openjdk.jdk"
  if [[ -d "$jdk_home" ]]; then
    sudo ln -sfn "$jdk_home" "/Library/Java/JavaVirtualMachines/$jdk.jdk"
  fi
done

yellow "Installing Neovim plugins"
nvim --headless +qa

yellow "Setting fish as the login shell"
fish_path="$(brew --prefix)/bin/fish"
if ! grep -qx "$fish_path" /etc/shells; then
  echo "$fish_path" | sudo tee -a /etc/shells >/dev/null
fi
if [[ "$SHELL" != "$fish_path" ]]; then
  chsh -s "$fish_path"
fi

green "Done"
