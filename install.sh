#!/usr/bin/env bash
#===============================================================================
#
#             NOTES: For this to work you must have cloned the github
#                    repo to your home folder as ~/dotfiles/
#
#===============================================================================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BANNER='\033[32;5;7m'
NOCOLOR='\033[0m'

#==============
# initialize submodules
#==============
echo -e "${YELLOW}Updating submodules${NOCOLOR}"
git submodule update --init --recursive> /dev/null 2>&1

#==============
# install homebrew
#==============
echo -e "${YELLOW}Checking homebrew${NOCOLOR}"
if ! command -v brew > /dev/null 2>&1
then
    echo -e "${RED}Homebrew is not installed${NOCOLOR}"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo -e "${GREEN}Homebrew is installed.${NOCOLOR}"
fi

#==============
# installing go
#==============
echo -e "${YELLOW}Checking Go${NOCOLOR}"
if ! command -v go > /dev/null 2>&1
then
    echo -e "${RED}Go is not installed${NOCOLOR}"
    brew install go
else
    echo -e "${GREEN}Go is installed.${NOCOLOR}"
fi

#==============
# Install packages
#==============
go run . install

#==============
# Kotlin language server
#==============
echo -e "${YELLOW}Installing Kotlin Language Server${NOCOLOR}"
./kotlin-language-server/gradlew -p "kotlin-language-server" :server:installDist > /dev/null 2>&1
/bin/cp ./kotlin-language-server/server/build/install/server/bin/kotlin-language-server /usr/local/bin/
/bin/cp ./kotlin-language-server/server/build/install/server/lib/* /usr/local/lib/

#==============
# Install Neovim extensions
#==============
echo -e "${YELLOW}Installing neovim plugins${NOCOLOR}"
nvim \
  +PlugInstall \
  +PlugClean! \
  +qall \
  --headless > /dev/null 2>&1

#==============
# Remove old dot flies
#==============
echo -e "${YELLOW}Removing old symlinks${NOCOLOR}"
rm -rf ~/.config/nvim 2>&1
rm -rf ~/.zshrc > /dev/null 2>&1
rm -rf ~/.gitconfig > /dev/null 2>&1
rm -rf ~/.gitignore_global > /dev/null 2>&1
rm -rf ~/.stCommitMsg > /dev/null 2>&1
rm -rf ~/.iterm2 > /dev/null 2>&1
rm -rf ~/.zprezto > /dev/null 2>&1
rm -rf ~/.zpreztorc > /dev/null 2>&1
rm -rf ~/.zshenv > /dev/null 2>&1
rm -rf ~/.zprofile > /dev/null 2>&1
rm -rf ~/.zsh > /dev/null 2>&1
rm -rf ~/.RProfile > /dev/null 2>&1
rm -rf ~/Library/Application\ Support/Code/User/settings.json 2>&1

#==============
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir
#==============
echo -e "${YELLOW}Creating symlinks${NOCOLOR}"
mkdir -p ~/.config/
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/stCommitMsg ~/.stCommitMsg
ln -sf ~/dotfiles/iterm2 ~/.iterm2
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/prezto ~/.zprezto
ln -sf ~/dotfiles/zpreztorc ~/.zpreztorc
ln -sf ~/dotfiles/zshenv ~/.zshenv
ln -sf ~/dotfiles/zprofile ~/.zprofile
ln -sf ~/dotfiles/zsh ~/.zsh
ln -sf ~/dotfiles/R/RProfile ~/.RProfile
ln -sf ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

#==============
# Install R packages
#==============
echo -e "${YELLOW}Installing R packages${NOCOLOR}"
for PACKAGE in \
  devtools \
  languageserver \

do
  if ! R -e "if (!require(\"$PACKAGE\")) {quit(1)}" > /dev/null 2>&1
    then
        echo -e "${RED}${PACKAGE} is not installed ${NOCOLOR}"
        R -e "install.packages(\"$PACKAGE\")"

    else
        echo -e "${GREEN}${PACKAGE} is already installed${NOCOLOR}"
    fi

done

#==============
# Set zsh as the default shell
#==============
echo -e "${YELLOW}Setting shell${NOCOLOR}"
if [[ "${SHELL}" != "/usr/local/bin/zsh" ]] ; then
    if ! grep /usr/local/bin/zsh /etc/shells > /dev/null 2>&1
    then
        echo -e "${RED}Appending /usr/local/bin/zsh to /etc/shells${NOCOLOR}"
        echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
    fi
    echo -e "${RED}you're shell is not /usr/local/bin/zsh and I'm attempting to change that!${NOCOLOR}"
    chsh -s /usr/local/bin/zsh
else
    echo -e "${GREEN}shell is /usr/local/bin/zsh${NOCOLOR}"
fi

#==============
# configure iTerm2
#==============
echo -e "${YELLOW}setting iTerm settings${NOCOLOR}"
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "${HOME}/.iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

#==============
# run post steps
#==============
echo -e "${YELLOW}run post steps${NOCOLOR}"
echo -e "${GREEN} fzf ${NOCOLOR}"
$(brew --prefix)/opt/fzf/install --all > /dev/null 2>&1

#==============
# And we are done
#==============
echo
echo -e "${BANNER}====== All Done!! ======"
echo             "                        "
echo -e          "  Enjoy -Jan            ${NOCOLOR}"
