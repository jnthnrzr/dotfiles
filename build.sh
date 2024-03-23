#!/usr/bin/env bash
set -efou pipefail

PLATFORM=$(uname -s)

# Proceed forward if this is OS X
if [[ $PLATFORM != 'Darwin' ]]
then
    exit
fi

TARGETS=(
    "brew"
    "chezmoi"
    "pyenv"
    "zsh"
)
MISSING=()

function build_pyenv() {
    printf "Setting up pyenv\n"
}

function build_chezmoi() {
    printf "Setting up chezmoi\n"
}

for TARGET in "${TARGETS[@]}"
do
    if ! command -v $TARGET &> /dev/null
    then
        MISSING+=("$TARGET")
    fi
done

for PROG in "${MISSING[@]}"
do
    build_$PROG
done
