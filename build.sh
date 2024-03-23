#!/usr/bin/env bash
set -efou pipefail

# Proceed forward if this is OS X
PLATFORM=$(uname -s)
if [[ $PLATFORM != 'Darwin' ]]
then
    exit
fi

function build_brew() {
    NONINTERACTIVE=1 /bin/bash -c \
        "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    source ~/.zprofile
}

function build_dependencies() {
    REQUIRED=(
        "git"
        "vim"
        "zsh"
    )

    for PROG in "${REQUIRED[@]}"
    do
        brew install $PROG
    done

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
