#!/bin/bash
#===============================================================================
#
#             NOTES: For this to work you must have cloned the github
#                    repo to your home folder as ~/dotfiles/
#
#===============================================================================

#==============
# update all plugins
#==============
git submodule update --init --recursive

#==============
# Remove old dot flies
#==============
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
~/dotfiles/vim/pack/plugins/start/YouCompleteMe/install.py

#==============
# Set zsh as the default shell
#==============
if [[ "${SHELL}" != "/bin/zsh" ]] ; then
    echo "you're shell is not /bin/zsh and I'm attempting to change that!"
    chsh -s /bin/zsh
fi

#==============
# configure iTerm2
#==============
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "${HOME}/.iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

#==============
# And we are done
#==============
echo -e "\\n====== All Done!! ======\\n"
echo
echo "Enjoy -Jan"
