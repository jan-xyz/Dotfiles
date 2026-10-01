/opt/homebrew/bin/brew shellenv fish | source

set -gx PYENV_ROOT $HOME/.pyenv
set -gx GOPATH $HOME/Go
set -gx CARGO_NET_GIT_FETCH_WITH_CLI true
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx FZF_DEFAULT_OPTS_FILE $HOME/.config/fzf/fzfrc
set -gx FZF_CTRL_T_OPTS "--preview 'head -200 {} 2>/dev/null || ls -A {}' --bind 'ctrl-/:change-preview-window(down|hidden|)'"
set -gx FZF_ALT_C_OPTS "--preview 'ls -A {}'"
set -gx FZF_CTRL_R_OPTS "--with-nth=1,3.."

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
    pyenv init - fish | source
    zoxide init --cmd cd fish | source
    starship init fish | source

    abbr -a vim nvim
end
