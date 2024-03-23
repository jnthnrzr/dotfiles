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
    NONINTERACTIVE=1 /bin/bash -c \
        "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    source ~/.zprofile
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

function build_autojump() {
    brew install autojump
}

function build_pyenv() {
    brew install pyenv
}

function build_tmux() {
    brew install tmux
}

function build_vim() {
    brew install vim
}

TARGETS=(
    "autojump"
    "pyenv"
    "tmux"
    "vim"
)

for TARGET in "${TARGETS[@]}"
do
    build_program $TARGET
done
