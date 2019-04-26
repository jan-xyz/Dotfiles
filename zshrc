#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Jan Steinke <jan.steinke@gmail.com>
#

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# vim config
bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey '^w' backward-kill-word

alias vim=nvim
alias diff=colordiff

# Environment Vars
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim
export VISUAL=nvim
export KEYTIMEOUT=1 # lag between switching vi modes
export PATH=/usr/local/bin:$PATH

# pyenv
if command -v pyenv > /dev/null 2>&1
then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Go configuration (installed with brew)
export GO111MODULE=on
export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# completion
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
source <(kubectl completion zsh)
unsetopt correct

# Kubernetes cluster and namespace in PS1
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1

# local configuration sourcing
if [ -d ~/.config/zsh/ ]; then
  for file in ~/.config/zsh/*.zsh(.); do
    source $file;
  done
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
