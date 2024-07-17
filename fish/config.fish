#
# Homebrew
#
set --export PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH

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
