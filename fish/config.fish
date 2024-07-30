#
# Homebrew
#
set --export PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH

#
# fzf
#
set --export FZF_DEFAULT_OPTS "--color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1 --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1 --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b"

#
# Pyenv
#
set --export PYENV_ROOT $HOME/.pyenv
set --export PATH $PYENV_ROOT/bin $PATH
set --export WORKON_HOME $HOME/Envs
pyenv init - | source

#
# Go
#
set --export GOPATH $HOME/Go
set --export PATH $PATH $GOPATH/bin

#
# Rust
#
set --export CARGO_NET_GIT_FETCH_WITH_CLI true
set --export PATH $PATH /usr/local/opt/llvm/bin/
set --export PATH $PATH $HOME/.cargo/bin

#
# Scala
#
set --export PATH $PATH $HOME/Library/Application\ Support/Coursier/bin

#
# Editors
#
set --export EDITOR '/opt/homebrew/bin/nvim'
set --export VISUAL '/opt/homebrew/bin/nvim'
set --export PAGER 'less'

# diable welcome message
set fish_greeting

#
# cd
#
zoxide init --cmd cd fish | source

#
# Prompt
#
starship init fish | source
