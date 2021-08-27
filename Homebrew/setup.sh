#!/bin/bash

FILENAME=$HOME/.Brewfile

e_error() {
    printf " \033[31m%s\033[m\n" "✖ $*" 1>&2
}

# die returns exit code error and echo error message
die() {
    e_error "$1" 1>&2
    exit "${2:-1}"
}

# install.shを実行した後にHomebrewをインストールする
if [ ! -e $FILENAME ]; then
    die "not found: ~/.Brewfile"
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew bundle --global
