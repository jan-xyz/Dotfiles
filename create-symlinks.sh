#!/bin/env bash
#===============================================================================
#
#             NOTES: For this to work you must have cloned the github
#                    repo to your home folder as ~/dotfiles/
#
#===============================================================================

#==============
# Remove old dot flies
#==============
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.gitignore_global > /dev/null 2>&1

#==============
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir
#==============
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/gitignore_global ~/.gitignore_global

#==============
# Set zsh as the default shell
#==============
chsh -s /bin/zsh

#==============
# And we are done
#==============
echo -e "\\n====== All Done!! ======\\n"
echo
echo "Enjoy -Jan"
