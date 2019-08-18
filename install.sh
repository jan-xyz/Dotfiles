#!/bin/zsh
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
# add homebrew taps
#==============
echo -e "${YELLOW}Adding Homebrew Taps${NOCOLOR}"
for TAP in homebrew/cask-fonts
do
    if ! brew tap | grep $TAP > /dev/null 2>&1
    then
        echo -e "${RED}${TAP} is not tapped${NOCOLOR}"
        brew tap $TAP
    else
        echo -e "${GREEN}${TAP} is already tapped${NOCOLOR}"
    fi
done


#==============
# install bottles
#==============
echo -e "${YELLOW}Installing bottles${NOCOLOR}"
for BOTTLE in fzf pyenv pyenv-virtualenv zsh shellcheck python3 python2 go cmake neovim kubernetes-cli ctags colordiff kube-ps1
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
for CASK in spotify telegram github iterm2 slack visual-studio-code postman iterm2 docker scroll-reverser aerial brooklyn font-fira-code
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
# Install python2 packages
#==============
echo -e "${YELLOW}Installing python2 packages${NOCOLOR}"
PYTHON_BIN=/usr/local/bin/python2
PACKAGES=(autopep8 pylint flake8 rope mccabe pyflakes jedi neovim python-language-server virtualenvwrapper)
${PYTHON_BIN} -m pip install --user -U $PACKAGES 2>&1

#==============
# Install python3 packages
#==============
echo -e "${YELLOW}Installing python3 packages${NOCOLOR}"
PYTHON_BIN=/usr/local/bin/python3
PACKAGES=( autopep8 pylint flake8 rope mccabe pyflakes jedi neovim mypy python-language-server virtualenvwrapper)
${PYTHON_BIN} -m pip install --user -U $PACKAGES 2>&1

#==============
# Install golang packages
#==============
echo -e "${YELLOW}Installing golang packages${NOCOLOR}"
pushd ~/Go
go get -u golang.org/x/tools/cmd/gopls
popd

#==============
# Install VS Code extensions
#==============
echo -e "${YELLOW}Installing VS Code extensions${NOCOLOR}"
for EXTENSION in ms-python.python vscodevim.vim ms-vsts.team ms-vscode.go samuelcolvin.jinjahtml ms-mssql.mssql arcticicestudio.nord-visual-studio-code ms-azuretools.vscode-docker
do
    if ! code --list-extensions | grep --ignore-case $EXTENSION > /dev/null 2>&1
    then
        echo -e "${RED}${EXTENSION} is not installed ${NOCOLOR}"
        code --install-extension $EXTENSION
    else
        echo -e "${GREEN}$EXTENSION is already installed${NOCOLOR}"
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

FONT_NAME="Source Code Pro for Powerline.otf"
DOWNLOAD_LOCATION="https://github.com/powerline/fonts/raw/master/SourceCodePro/Source%20Code%20Pro%20for%20Powerline.otf"
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
rm -rf ~/.config/nvim 2>&1
rm -rf ~/.zshrc > /dev/null 2>&1
rm -rf ~/.gitconfig > /dev/null 2>&1
rm -rf ~/.gitignore_global > /dev/null 2>&1
rm -rf ~/.iterm2 > /dev/null 2>&1
rm -rf ~/.zprezto > /dev/null 2>&1
rm -rf ~/.zpreztorc > /dev/null 2>&1
rm -rf ~/.zshenv > /dev/null 2>&1
rm -rf ~/.zprofile > /dev/null 2>&1
rm -rf ~/.zsh > /dev/null 2>&1
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
ln -sf ~/dotfiles/iterm2 ~/.iterm2
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/prezto ~/.zprezto
ln -sf ~/dotfiles/zpreztorc ~/.zpreztorc
ln -sf ~/dotfiles/zshenv ~/.zshenv
ln -sf ~/dotfiles/zprofile ~/.zprofile
ln -sf ~/dotfiles/zsh ~/.zsh
ln -sf ~/dotfiles/vscode/User/settings.json ~/Library/Application\ Support/Code/User/settings.json

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
$(brew --prefix)/opt/fzf/install --all # fzf

#==============
# And we are done
#==============
echo
echo -e "${BANNER}====== All Done!! ======"
echo             "                        "
echo -e          "  Enjoy -Jan            ${NOCOLOR}"
