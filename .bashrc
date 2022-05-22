# Enable programmable completion features.
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# Set the PS1 prompt (with colors).
# Based on http://www-128.ibm.com/developerworks/linux/library/l-tip-prompt/
# And http://networking.ringofsaturn.com/Unix/Bash-prompts.php .

# -- COLORS --
blue="\[\033[38;5;4m\]"
red="\[\033[38;5;204m\]"
pink="\033[38;5;9m\]"
gold="\[\033[38;5;220m\]"
# green="\[\033[38;5;46m\]"
palegreen="\[\033[38;5;46m\]"
green="\[\033[38;5;35m\]"
reset="\[\033[0m\]"

# SAMPLE PS1
# export PS1="$purple\u$green\$(__git_ps1)$blue \W $ $reset"
# export PS1="$red\u$blue\$(__git_ps1)$gold \W $green$ $reset"
# source ~/git-prompt.sh
# export PS1="$palegreen[\@]$gold\$(__git_ps1)$red \w $blue\n$ $reset"
# PS1="\[\e[36;1m\]\h:\[\e[32;1m\]\w$ \[\e[0m\]"

# Set the default editor to vim.
export EDITOR=vim

# Avoid succesive duplicates in the bash command history.
export HISTCONTROL=ignoredups

# Append commands to the bash command history file (~/.bash_history)
# instead of overwriting it.
# shopt -s histappend

# Append commands to the history every time a prompt is shown,
# instead of after closing the session.
PROMPT_COMMAND='history -a'

# ADB Fastboot
if [ -d "$HOME/adb-fastboot/platform-tools"  ] ; then
    export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
fi

# Add bash aliases.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
# [ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
# [ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
# [ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bashexport LC_ALL=C.UTF-8
export LANG=C.UTF-8

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
