# Dotfiles

![go](https://github.com/jan-xyz/Dotfiles/workflows/go/badge.svg)

This repository currently holds two different things:

1. the configuration of my personal dotfiles setup
1. the source code for a general purpose dotfiles management tool written in Go.

You can use the the dotfile tool yourself to manage your setup. See the
`config.toml` on how to use it.

Get the tool by either running it with go

```sh
go run github.com/jan-xyz/dotfiles install
```

or by downloading the pre-compiled binary

```sh
export version=0.2.2
curl -L https://github.com/jan-xyz/Dotfiles/releases/download/v${version}/dotfiles-Darwin-x86_64.gz | gzip -N -d > dotfiles-${version}
chmod +x ./dotfiles-${version}
./dotfiles-${version} install
```

## configuration for

* neovim
* zsh
* iterm2
* vscode
* homebrew
* mac app store
* system preferences

## install

```sh
./install.sh
```
