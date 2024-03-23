#!/usr/bin/env bash
set -efou pipefail

PLATFORM=$(uname -s)

# Proceed forward if this is OS X
if [[ $PLATFORM != 'Darwin' ]]
then
    exit
fi

function build_brew() {
    echo "Setting up homebrew"
}


function build_program() {
    if command -v $1 &> /dev/null; then
        :
    else
        build_$1
    fi
}

build_program brew

function build_pyenv() {
    printf "Setting up pyenv\n"
}

function build_chezmoi() {
    printf "Setting up chezmoi\n"
}

TARGETS=(
    "chezmoi"
    "pyenv"
    "zsh"
)

for TARGET in "${TARGETS[@]}"
do
    build_program $TARGET
done
