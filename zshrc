#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Jan Steinke <jan.steinke@gmail.com>
#

# autostart tmux
# if [ "$TMUX" = "" ]; then tmux; fi

# Environment Vars
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim
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
#eval "$(pyenv init -)"

# rbenv configuration
#eval "$(rbenv init -)"

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
