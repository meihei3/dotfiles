#!/bin/bash

e_error() {
    printf " \033[31m%s\033[m\n" "✖ $*" 1>&2
}

# is_exists returns true if executable $1 exists in $PATH
is_exists() {
    which "$1" >/dev/null 2>&1
    return $?
}

# has is wrapper function
has() {
    is_exists "$@"
}

# die returns exit code error and echo error message
die() {
    e_error "$1" 1>&2
    exit "${2:-1}"
}

if ! has "fish"; then
    die "command not found: fish"
fi

# fishをデフォルトシェルにする
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

# 色々入れる
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
curl -L https://get.oh-my.fish | fish
fisher install jethrokuan/z
fisher install jethrokuan/fzf