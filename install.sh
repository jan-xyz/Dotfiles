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
git submodule update --init --recursive >/dev/null 2>&1

#==============
# install homebrew
#==============
echo -e "${YELLOW}Checking homebrew${NOCOLOR}"
if ! command -v brew >/dev/null 2>&1; then
	echo -e "${RED}Homebrew is not installed${NOCOLOR}"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	echo -e "${GREEN}Homebrew is installed.${NOCOLOR}"
fi

#==============
# run go dotfiles tool
#==============
make run

#==============
# setup system Java wrappers to find homebrew JDKs
#==============
echo -e "${YELLOW}Setting up Java wrappers for homebrew JDK${NOCOLOR}"
sudo ln -sfn "$(brew --prefix)/opt/openjdk@17/libexec/openjdk.jdk" "/Library/Java/JavaVirtualMachines/openjdk-17.jdk"
sudo ln -sfn "$(brew --prefix)/opt/openjdk@11/libexec/openjdk.jdk" "/Library/Java/JavaVirtualMachines/openjdk-11.jdk"
sudo ln -sfn "$(brew --prefix)/opt/openjdk@8/libexec/openjdk.jdk" "/Library/Java/JavaVirtualMachines/openjdk-8.jdk"

#==============
# Install Neovim extensions
#==============
echo -e "${YELLOW}Installing neovim plugins${NOCOLOR}"
nvim --headless "+Lazy! sync" +qall >/dev/null 2>&1

#==============
# Set zsh as the default shell
#==============
shell_path=$(brew --prefix)/bin/zsh
echo -e "${YELLOW}Setting shell${NOCOLOR}"
if [[ ${SHELL} != "${shell_path}" ]]; then
	if ! grep "${shell_path}" /etc/shells >/dev/null 2>&1; then
		echo -e "${RED}Appending ${shell_path} to /etc/shells${NOCOLOR}"
		echo "${shell_path}" | sudo tee -a /etc/shells
	fi
	echo -e "${RED}you're shell is not ${shell_path} and I'm attempting to change that!${NOCOLOR}"
	chsh -s "${shell_path}"
else
	echo -e "${GREEN}shell is ${shell_path}${NOCOLOR}"
fi

#==============
# run post steps
#==============
echo -e "${YELLOW}run post steps${NOCOLOR}"
echo -e "${GREEN} fzf ${NOCOLOR}"
"$(brew --prefix)/opt/fzf/install" --all >/dev/null 2>&1

#==============
# And we are done
#==============
echo
echo -e "${BANNER}====== All Done!! ======"
echo "                        "
echo -e "  Enjoy -Jan            ${NOCOLOR}"
