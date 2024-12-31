#!/usr/bin/env bash
# shellcheck disable=2034,1091
# use inline `export VAR=...` statements, for fish compatibility`

# Used by the dorothy `interactive.sh command`, not to be confused with 'config/interactive.sh'

# load defaults
# common POSIX (Bash, Zsh, Dash, KSH, etc) config/interactive.sh:

source "$DOROTHY/config/interactive.bash"

# load cross shell `sh` files
source "$DOROTHY/user/config/interactive.sh"

for f in "$DOROTHY/user/sources/"*.bash; do
  source "$f"
done

export DOROTHY_THEME=oz
export DESU=desu-bash

eval "$(~/.local/bin/mise activate bash)"