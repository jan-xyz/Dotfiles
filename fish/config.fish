/opt/homebrew/bin/brew shellenv fish | source

set -gx PYENV_ROOT $HOME/.pyenv
set -gx GOPATH $HOME/Go
set -gx CARGO_NET_GIT_FETCH_WITH_CLI true
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx FZF_DEFAULT_OPTS --color=16

fish_add_path -g \
    $HOME/.local/bin \
    /opt/homebrew/opt/rustup/bin \
    $HOME/.cargo/bin \
    /opt/homebrew/opt/curl/bin \
    /opt/homebrew/opt/llvm/bin \
    /Applications/Ghostty.app/Contents/MacOS
fish_add_path -gPa \
    $GOPATH/bin \
    "$HOME/Library/Application Support/Coursier/bin" \
    $HOME/.lmstudio/bin

if status is-interactive
    set -g fish_greeting

    pyenv init - fish | source
    zoxide init --cmd cd fish | source
    starship init fish | source

    abbr -a vim nvim
end
