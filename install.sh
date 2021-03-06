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
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo -e "${GREEN}Homebrew is installed.${NOCOLOR}"
fi

#==============
# run go dotfiles tool
#==============
make run

# setup system Java wrappers to find this JDK
echo -e "${YELLOW}Setting up Java wrappers for homebrew JDK${NOCOLOR}"
sudo ln -sfn "$(brew --prefix)/opt/openjdk@16/libexec/openjdk.jdk" "/Library/Java/JavaVirtualMachines/openjdk-16.jdk"
sudo ln -sfn "$(brew --prefix)/opt/openjdk@11/libexec/openjdk.jdk" "/Library/Java/JavaVirtualMachines/openjdk-11.jdk"
sudo ln -sfn "$(brew --prefix)/opt/openjdk@8/libexec/openjdk.jdk" "/Library/Java/JavaVirtualMachines/openjdk-8.jdk"

#==============
# Install Neovim extensions
#==============
echo -e "${YELLOW}Installing neovim plugins${NOCOLOR}"
nvim \
	+PackerSync \
	+qall \
	--headless >/dev/null 2>&1

#==============
# Set zsh as the default shell
#==============
echo -e "${YELLOW}Setting shell${NOCOLOR}"
if [[ ${SHELL} != "/usr/local/bin/zsh" ]]; then
	if ! grep /usr/local/bin/zsh /etc/shells >/dev/null 2>&1; then
		echo -e "${RED}Appending /usr/local/bin/zsh to /etc/shells${NOCOLOR}"
		echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
	fi
	echo -e "${RED}you're shell is not /usr/local/bin/zsh and I'm attempting to change that!${NOCOLOR}"
	chsh -s /usr/local/bin/zsh
else
	echo -e "${GREEN}shell is /usr/local/bin/zsh${NOCOLOR}"
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
