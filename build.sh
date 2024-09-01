#!/usr/bin/env bash
set -efou pipefail

# Proceed forward if this is OS X
PLATFORM=$(uname -s)
if [[ $PLATFORM != 'Darwin' ]]; then
    exit
fi

build_brew() {
    NONINTERACTIVE=1 /bin/bash -c \
        "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    source ~/.zprofile
}

build_dependencies() {
    # Required programs have to be installed first
    REQUIRED=(
        "git"
        "vim"
        "zsh"
    )

    for PROG in "${REQUIRED[@]}"
    do
        brew install $PROG
    done

    # These are all other programs
    TARGETS=(
        "autojump"
        "pyenv"
        "tmux"
    )

    for TARGET in "${TARGETS[@]}"
    do
        brew install $TARGET
    done
}


build_brew
build_dependencies
