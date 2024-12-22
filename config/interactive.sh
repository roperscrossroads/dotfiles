#!/usr/bin/env sh
# use inline `export VAR=...` statements, for fish compatibility`:
# shellcheck disable=SC2034

# Common POSIX (Bash, Zsh, Dash, KSH, etc) interactive.sh
# Used by the dorothy `interactive.sh command`, not to be confused with 'config/interactive.sh'
# Must be compatible with fish, zsh, bash

# Tell Dorothy which theme to load, if any.
# Used by `theme.sh` and `theme.fish`
# You can use `select-theme` to configure this.

export DOROTHY_THEME=starship
export DESU=desu

# load defaults
source "$DOROTHY/config/interactive.sh"


source $HOME/.atuin/bin/env