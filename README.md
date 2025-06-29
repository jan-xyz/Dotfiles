# Dotfiles

[![go](https://github.com/jan-xyz/Dotfiles/actions/workflows/go.yaml/badge.svg)](https://github.com/jan-xyz/Dotfiles/actions/workflows/go.yaml)
[![lua](https://github.com/jan-xyz/Dotfiles/actions/workflows/lua.yaml/badge.svg)](https://github.com/jan-xyz/Dotfiles/actions/workflows/lua.yaml)
[![release](https://github.com/jan-xyz/Dotfiles/actions/workflows/release.yaml/badge.svg)](https://github.com/jan-xyz/Dotfiles/actions/workflows/release.yaml)
[![codecov](https://codecov.io/gh/jan-xyz/Dotfiles/branch/main/graph/badge.svg?token=06WzNl7Ymy)](https://codecov.io/gh/jan-xyz/Dotfiles)

This repository currently holds two different things:

1. the configuration of my personal dotfiles setup
2. the source code for a general purpose dotfiles management tool written in Go.

You can use the the dotfile tool yourself to manage your setup. See the
`config.toml` on how to use it.

Get the tool by either running it with go

```sh
go run github.com/jan-xyz/dotfiles install
```

or by downloading the pre-compiled binary

```sh
export version=0.3.3
curl -L https://github.com/jan-xyz/Dotfiles/releases/download/v${version}/dotfiles-Darwin-x86_64.gz | gzip -N -d > dotfiles-${version}
chmod +x ./dotfiles-${version}
./dotfiles-${version} install
```

## configuration for

* neovim
* fish
* kitty
* homebrew
* mac app store
* system preferences

## install

```sh
./install.sh
```
