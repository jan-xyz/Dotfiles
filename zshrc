#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Jan Steinke <jan.steinke@gmail.com>
#

# autostart tmux
# if [ "$TMUX" = "" ]; then tmux; fi

# vim config
bindkey -v
alias vim=nvim

# Environment Vars
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim
export VISUAL=nvim
export KEYTIMEOUT=1 # lag between switching vi modes
export PATH=/usr/local/bin:$PATH

# Java configuration
#export JAVA_HOME=$(/usr/libexec/java_home)

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# virtualenv configuration
#export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/DevBase
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
#export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
#export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
#source /usr/local/bin/virtualenvwrapper.sh

# pyenv
if command -v pyenv > /dev/null 2>&1
then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# rbenv configuration
if command -v pyenv > /dev/null 2>&1
then
    eval "$(rbenv init -)"
fi

# Go configuration (installed with brew)
export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# groovy configuration (installed with brew)
export GROOVY_HOME=/usr/local/opt/groovy/libexec

# completion
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
source <(kubectl completion zsh)
unsetopt correct

# local configuration sourcing
if [ -d ~/.config/zsh/ ]; then
  for file in ~/.config/zsh/*.zsh(.); do
    source $file;
  done
fi
