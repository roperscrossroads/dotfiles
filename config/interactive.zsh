#!/usr/bin/env bash
# shellcheck disable=SC2034
# use inline `export VAR=...` statements, for fish compatibility`

# load defaults
source "$DOROTHY/config/interactive.zsh"

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
if test -d "$HOME/.oh-my-zsh"; then
	export DISABLE_UPDATE_PROMPT=true
	export ZSH="$HOME/.oh-my-zsh"
	# export ZSH_THEME='avit'
	export plugins=(terminalapp osx autojump bower brew brew-cask cake coffee cp docker gem git heroku node npm nvm python ruby)
	if test -f "$ZSH/oh-my-zsh.sh"; then
		source "$ZSH/oh-my-zsh.sh"
	fi
fi

eval "$(atuin init zsh --disable-up-arrow)"