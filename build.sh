#!/usr/bin/env bash
set -efou pipefail

# Proceed forward if this is OS X
PLATFORM=$(uname -s)
if [[ $PLATFORM != 'Darwin' ]]
then
    exit
fi

REQUIRED=(
    "brew"
    "zsh"
)

function build_brew() {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
}

function build_zsh() {
    brew install zsh
}


function build_program() {
    if command -v $1 &> /dev/null; then
        :
    else
        build_$1
    fi
}

for PROG in "${REQUIRED[@]}"
do
    build_program $PROG
done

function build_pyenv() {
    brew install pyenv
}

function build_autojump() {
    brew install autojump
}

TARGETS=(
    "autojump"
    "pyenv"
)

for TARGET in "${TARGETS[@]}"
do
    build_program $TARGET
done
