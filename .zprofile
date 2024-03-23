# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# export PATH="$HOME/.cargo/bin:$PATH"
# eval "$(pyenv init --path)"
# alias ide="poetry run vim"
