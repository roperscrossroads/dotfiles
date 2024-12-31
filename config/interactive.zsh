#!/usr/bin/env bash
# shellcheck disable=SC2034
# use inline `export VAR=...` statements, for fish compatibility`

# load defaults
#source "$DOROTHY/config/interactive.zsh"

# load cross shell `sh` files
source "$DOROTHY/user/config/interactive.sh"

# cross shell scripts should b written in `sh`
# `sh`is the only script that is allowed to be sourced in other shells.
# source "$DOROTHY/user/config/interactive.bash" #??

for f in "$DOROTHY/user/sources/"*.zsh; do
    source "$f"
done

# # fzf support
# github_fzf_helper="$GHQ_GITHUB/junegunn/fzf-git.sh/fzf-git.sh"
# set -x
# if [[ -f "$github_fzf_helper" ]]; then
# source "$GHQ_GITHUB/junegunn/fzf-git.sh/fzf-git.sh"
# fi
# set +x

# Load oh-my-zsh if it exists on the system
if test -d "$ZSH"; then
	export DISABLE_UPDATE_PROMPT=true
	# export ZSH_THEME='avit'
	export plugins=(z git kubectl microk8s zsh-autosuggestions zsh-syntax-highlighting zsh-completions web-search colored-man-pages diff-so-fancy tmuxinator fzf-tab sudo)
	if test -f "$ZSH/oh-my-zsh.sh"; then
		source "$ZSH/oh-my-zsh.sh"
	fi
fi

eval "$(~/.local/bin/mise activate zsh)"
eval "$(atuin init zsh --disable-up-arrow)"