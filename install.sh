#!/bin/bash
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
# install bottles
#==============
echo -e "${YELLOW}Installing bottles${NOCOLOR}"
for BOTTLE in pyenv zsh shellcheck python3 go cmake neovim
do
    if ! brew list $BOTTLE > /dev/null 2>&1
    then
        echo -e "${RED}${BOTTLE} is not installed${NOCOLOR}"
        brew install $BOTTLE
    else
        echo -e "${GREEN}${BOTTLE} is already installed${NOCOLOR}"
    fi
done

#==============
# install casks
#==============
echo -e "${YELLOW}Installing casks${NOCOLOR}"
for CASK in spotify telegram github iterm2 slack visual-studio-code postman iterm2 docker
do
    if ! brew cask list $CASK > /dev/null 2>&1
    then
        echo -e "${RED}${CASK} is not installed ${NOCOLOR}"
        brew cask install $CASK
    else
        echo -e "${GREEN}$CASK is already installed${NOCOLOR}"
    fi
done

#==============
# Install python packages
#==============
echo -e "${YELLOW}Installing pip packages${NOCOLOR}"
for PACKAGE in autopep8 pylint flake8 pyflakes jedi neovim
do
    if ! pip3 show $PACKAGE > /dev/null 2>&1
    then
        echo -e "${RED}${PACKAGE} is not installed ${NOCOLOR}"
        pip3 install $PACKAGE
    else
        echo -e "${GREEN}$PACKAGE is already installed${NOCOLOR}"
    fi
done

#==============
# update all plugins
#==============
echo -e "${YELLOW}Updating submodules${NOCOLOR}"
git submodule update --init --recursive > /dev/null 2>&1

#==============
# install Font
#==============
echo -e "${YELLOW}Installing Powerline Font${NOCOLOR}"
FONT_NAME="Meslo LG M Regular for Powerline.ttf"
DOWNLOAD_LOCATION="https://github.com/powerline/fonts/raw/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf"
if [[ ! -f ~/Library/Fonts/${FONT_NAME} ]]
then
    echo -e "${RED}${FONT_NAME} is not installed ${NOCOLOR}"
    curl -H 'Accept: application/vnd.github.v3.raw' -L ${DOWNLOAD_LOCATION} -o "${HOME}/Library/Fonts/${FONT_NAME}" > /dev/null 2>&1
else
    echo -e "${GREEN}$FONT_NAME is already installed${NOCOLOR}"
fi

#==============
# Remove old dot flies
#==============
echo -e "${YELLOW}Removing old symlinks${NOCOLOR}"
rm -rf ~/.vimrc > /dev/null 2>&1
rm -rf ~/.vim > /dev/null 2>&1
rm -rf ~/.zshrc > /dev/null 2>&1
rm -rf ~/.gitconfig > /dev/null 2>&1
rm -rf ~/.gitignore_global > /dev/null 2>&1
rm -rf ~/.tmux.conf > /dev/null 2>&1
rm -rf ~/.tmux > /dev/null 2>&1
rm -rf ~/.iterm2 > /dev/null 2>&1
rm -rf ~/.zprezto > /dev/null 2>&1
rm -rf ~/.zpreztorc > /dev/null 2>&1
rm -rf ~/.zshenv > /dev/null 2>&1
rm -rf ~/.zprofile > /dev/null 2>&1

#==============
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir
#==============
echo -e "${YELLOW}Creating symlinks${NOCOLOR}"
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/vim ~/.vim
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/tmux ~/.tmux
ln -sf ~/dotfiles/iterm2 ~/.iterm2
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/prezto ~/.zprezto
ln -sf ~/dotfiles/zpreztorc ~/.zpreztorc
ln -sf ~/dotfiles/zshenv ~/.zshenv
ln -sf ~/dotfiles/zprofile ~/.zprofile

#==============
# install vim plugins
#==============
echo -e "${YELLOW}Building YCM${NOCOLOR}"
~/dotfiles/vim/pack/plugins/start/YouCompleteMe/install.py --go-completer --java-completer > /dev/null 2>&1

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
# And we are done
#==============
echo
echo -e "${BANNER}====== All Done!! ======"
echo             "                        "
echo -e          "  Enjoy -Jan            ${NOCOLOR}"
