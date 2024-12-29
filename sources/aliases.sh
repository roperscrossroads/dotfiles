# reload aliases
function reload_aliases() {
	echo "[RELOADING SHELL]"
	source "$DOROTHY/sources/environment.sh"
	source "$DOROTHY/sources/interactive.sh"
	# source "$DOROTHY/user/sources/aliases.sh"
	# source "$DOROTHY/user/sources/nvim.sh"
	# source $DOROTHY/user/sources/asdf.bash
	# source $XDG_CONFIG_HOME/dorothy/sources/aliases.sh
	# source $XDG_CONFIG_HOME/dorothy/sources/nvim.sh
}
alias ralias="reload_aliases"
alias rl="reload_aliases"

alias il="zsh -il"

alias editd-aliases="vim $DOROTHY/user/sources/aliases.sh"
alias editd-dorothy-user="vim $DOROTHY/user"
alias editd-envs="vim $DOROTHY/user/config/environment.bash"
alias editd-xdg="vim $HOME/.config/dorothy/config.xdg"

alias XDH="$XDG_DATA_HOME"


#---------------------------
#---       general       ---
#---------------------------
# # # Colorize commands when possible.
# alias \
# 	# ls="ls -hN --color=auto --group-directories-first" \ # illegal on macos
# 	grep="grep --color=auto" \
# 	diff="diff --color=auto" \
# 	# ccat="highlight --out-format=ansi" # only linux
alias x="exec zsh -il"
alias xx="exec elvish"
alias xxx="exec fish -il"
alias k="clear"
alias less="less -r"
alias md="mkdir -p"
alias ZZ=exit

#---------------------------
#---       DOROTHY       ---
#---------------------------

alias d='dorothy'
alias dp='dorothy permissions'

alias dr='cd "$DOROTHY"'

alias sdri="setup-install"
alias sdr="setup-dorothy"
alias sdrp="setup-dorothy-permissions"
alias ssha="ssh-add-all"

alias dtr='cd "$DOROTHY" && ${VISUAL:-${EDITOR:-vim}} .'

# USER

alias dt='cd "$XDG_CONFIG_HOME/dorothy"'
alias dte='cd "$XDG_CONFIG_HOME/dorothy" && ${VISUAL:-${EDITOR:-vim}} .'

alias sup="setup-personal-stuff"
alias suc="setup-user-configs"
#---------------------------------------
#---       SEARCH & FIND FILES       ---
#---------------------------------------

# fo [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fo() {
	local files
	IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
	[[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# fh [FUZZY PATTERN] - Search in command history
fz() {
	print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fuzzy grep via rg and open in vim with line number
fgr() {
	local file
	local line

	read -r file line <<<"$(rg --no-heading --line-number $@ | fzf -0 -1 | awk -F: '{print $1, $2}')"

	if [[ -n $file ]]; then
		vim $file +$line
	fi
}

# ------------------------
# ---       TMUX       ---
# ------------------------

# https://github.com/tmux-plugins
# https://github.com/tmux-plugins/list

# https://github.com/sainnhe/tmux-fzf
# https://github.com/wfxr/tmux-fzf-url
# https://github.com/Aloxaf/fzf-tab
# https://github.com/yardnsm/tmux-1password
# https://github.com/isuryanarayanan/tmuxinator-fzf-helper/blob/main/tmuxinator-helper.sh
# https://github.com/camspiers/tmuxinator-fzf-start
# https://github.com/danielpieper/telescope-tmuxinator.nvim
# https://github.com/Bajena/TmuxinatorMultiLaunch
# https://github.com/ethagnawl/rmuxinator
# https://github.com/roosta/tmux-fuzzback
# https://github.com/rafi/tmux-pass
# https://github.com/tomhoule/gitmoji-selector
# https://programmer.ink/think/creating-an-efficient-front-end-working-environment-tmuxinator.html
# https://github.com/drmad/tmux-git

# how to save current session?
# https://stackoverflow.com/questions/16752088/how-to-save-tmux-session-to-tmuxinator-project
# https://forum.upcase.com/t/save-and-reopen-tmux-session/5224/2
# https://github.com/search?q=tmux+save
# https://github.com/ynishi/tmux-save
# https://www.reddit.com/r/commandline/comments/2ocqw3/dont_you_wish_you_could_save_and_load_tmux/

# tmux tips
# https://www.sitepoint.com/10-killer-tmux-tips/

# tmux configs
# https://github.com/search?q=tmux+configuration

# tm [SESSION_NAME | FUZZY PATTERN] - create new tmux session, or switch to existing one.
# Running `tm` will let you fuzzy-find a session mame
# Passing an argument to `ftm` will switch to that session if it exists or create it otherwise

# tmux new session
tns() {
	[[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
	if [ $1 ]; then
		tmux $change -t "$1" 2>/dev/null ||
			(tmux new-session -d -s $1 && tmux $change -t "$1")
		return
	fi
	session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&
		tmux $change -t "$session" || echo "No sessions found."
}

# tm [SESSION_NAME | FUZZY PATTERN] - delete tmux session
# Running `tm` will let you fuzzy-find a session mame to delete
# Passing an argument to `ftm` will delete that session if it exists
tks() {
	if [ $1 ]; then
		tmux kill-session -t "$1"
		return
	fi
	session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&
		tmux kill-session -t "$session" || echo "No session found to delete."
}

# tm [window name | fuzzy pattern]
# so that I can focus on building tmuxinator sessions, which I then can
# search windows. sometimes there are many windows

# ftw() {
# }

alias tm="tmux"
alias tk="tmux kill-session"
alias tn="tmuxinator"

#---------------------------
#---       dockers       ---
#---------------------------

alias dk="docker"
alias dkc="docker-compose"

#---------------------------------
#---       file browsers       ---
#---------------------------------

alias fh="fff"
alias fj="lf"
alias fk="ranger"
alias fn="nnn"

# switch cwd on exit
function ranger {
	local IFS=$'\t\n'
	local tempfile="$(mktemp -t tmp.XXXXXX)"
	local ranger_cmd=(
		command
		ranger
		--cmd="map Q chain shell echo %d > "$tempfile"; quitall"
	)

	${ranger_cmd[@]} "$@"
	if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n $(pwd))" ]]; then
		cd -- "$(cat "$tempfile")" || return
	fi
	command rm -f -- "$tempfile" 2>/dev/null
}

# #-----------------------
# #---       VIM       ---
# #-----------------------

# # Use neovim for vim if present.
# [ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# alias vim="nvim"
# alias v="nvim"
# alias vv="~/code/neovim/build/bin/nvim" # forked build
# alias vf="nvim -t" # search for tag
# alias vr="nvim -R"
# alias vh="nvim -headless"
# alias vNN="nvim -u NONE"
# alias vNC="nvim -u NORC"
# alias vh="nvim -headless"
# alias vp="nvim --cmd \"set rtp+=\$(pwd)\""

#-----------------------
#---       GIT       ---
#-----------------------

function fco() {
	git checkout $(git branch -a --sort=-committerdate |
		cut -c 3- |
		sed 's/^remotes\/[^/]*\///' |
		sort |
		uniq |
		grep -v HEAD |
		fzf-tmux -d 20)
}

# fbr [FUZZY PATTERN] - Checkout specified branch
# Include remote branches, sorted by most recent commit and limited to 30
fgb() {
	local branches branch
	branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
		branch=$(echo "$branches" |
			fzf-tmux -d $((2 + $(wc -l <<<"$branches"))) +m) &&
		git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

alias gs='git status -sb'
alias gcfls="git conflicts"
alias sv="git add --all && git commit -m 'save'"
alias svp="git add --all && git commit -m 'save' && git push"
alias lg="lazygit"
alias gcbn="git-get-checked-out-branch-name"
# list branches by last date modified
alias gbld="git for-each-ref --sort=committerdate refs/heads/ --format='%(color: red)%(committerdate:short) %(color: cyan)%(refname:short)'"

#-----------------------
#---       GITHUB       ---
#-----------------------

# add this to `ghm`
alias ghfk="gh repo fork"
alias ghprdev="gh pr create --base develop"

# todo: if not main then check for master..
alias ghprmst="gh pr create --base master"

# @param repo name
# @param description
function ghrc() {
	gh repo create $1 --public
}
function ghrcc() {
	gh repo create $1 --public -c
}

# -----------------------
# ---       GHQ       ---
# -----------------------

alias ghg="ghq get -p"
alias ghC="ghq create"
alias ghl="ghq list"
alias ghr="ghq root"
alias ghh="ghq help"

#-----------------------
#---       GPG       ---
#-----------------------

alias gpglk="gpg --list-keys"
alias gpglkp="gpg --list-public-keys"
alias gpglks="gpg --list-secret-keys"
alias gpge="gpg --edit-keys"

#--------------------------
# Directories and files
#--------------------------
alias la='/usr/bin/ls'
#alias la='ls -lAFh'
alias ls='eza --color=always --long --all --header --icons --git'
alias lsa='eza --color=always --long --all --sort=age --reverse --header --icons'
alias lsf='fd --max-depth=1 --type=file'
alias lst='eza --tree --level=2 --icons --color=always --git'
alias lsdir='ls -ld *(/om[1])'
alias drs="dirs -v"
alias l="ls -la"
alias ldot='ls -ld .*'


#--------------------------
#---       OTHERS       ---
#-------------------------

function pgrefresh() {
	rm -fr /usr/local/var/postgres/postmaster.pid
	brew services restart postgresql
}

function cheat() {
	curl cht.sh/$1
}

function opendir() {
	local file="$1"
	local dir=$(dirname "$file")
	open "$dir"
}
#----------------------------
#---       ZSH ONLY       ---
#----------------------------

if [[ -n ${ZSH_VERSION-} ]]; then
	alias -- -='cd -'
	alias 1='cd -'
	alias 2='cd -2'
	alias 3='cd -3'
	alias 4='cd -4'
	alias 5='cd -5'
	alias 6='cd -6'
	alias 7='cd -7'
	alias 8='cd -8'
	alias 9='cd -9'

	alias ..='cd ..'
	alias -g ..2='../..'
	alias -g ..3='../../..'
	alias -g ..4='../../../..'
	alias -g ..5='../../../../..'
	alias -g ...='../..'
	alias -g ....='../../..'
	alias -g .....='../../../..'
	alias -g ......='../../../../..'

	# alias zshrc='$VISUAL "${ZDOTDIR:-$HOME}"/.zshrc'
	alias reload='source "${ZDOTDIR:-$HOME}"/.zshrc'
	alias zbench='export LAZY_PROMPT=false; for i in $(seq 1 10); do; /usr/bin/time zsh -i -c exit; done; unset LAZY_PROMPT'
	alias zdot='cd $ZDOTDIR'

	# zsh pipes
	alias -g S='| sort'
	#todo: remove colors:
	alias -g C='| sed -r "s/\x1b\[[0-9;]*m//g" | xsel --clipboard'
	alias -g G='| grep -i --color=always'
#	alias -g G='| grep -E'
	alias -g H=' --help'
	#alias -g H='| head'
	alias -g L='| less'
	alias -g M='| more'
	alias -g NUL="> /dev/null 2>&1"
	#alias -g R="2>&1 | tee output.txt"
	alias -g T="| tail -n +2"
	alias -g V=' --version'
	alias -g W='| nvim -c "setlocal buftype=nofile bufhidden=wipe filetype=markdown" -c "nnoremap <buffer> q :q!<CR>" -'

	# Suffix aliases
	alias -s md=nvim
	#alias -s txt=nvim
	alias -s yaml=nvim
	alias -s html='xdg-open'
fi

# Directories and files
alias la='/usr/bin/ls'
alias ls='eza --color=always --long --all --header --icons --git'
alias lsa='eza --color=always --long --all --sort=age --reverse --header --icons'
alias lsf='fd --max-depth=1 --type=file'
alias lst='eza --tree --level=2 --icons --color=always --git'
alias lsdir='ls -ld *(/om[1])'

# incus aliases
alias inc='incus console ubuntu --type=vga'
## start and stop lxc vm with hybernated state
## meaning all programs and windows will preserve
alias inc--='incus stop --stateful ubuntu'
alias inc-='incus stop ubuntu'

# Commands shadow
alias tf='terraform'
alias lpf='list_project_files'
alias watchtui='nodemon --signal SIGTERM -q --watch ~/.taskrc --ext taskrc --exec "tui --report current"'
alias k9s='k9s -A'
alias bfi='__create_branch_from_issue.sh'
alias si='__search_internet.py'
alias vm="nvim -c ':lua MiniFiles.open()'"
alias aider='aider --model gpt-4o --dark-mode --no-auto-commits'
alias aider-commit='aider --model gpt-4o --dark-mode'
alias cat='bat --paging=never'
alias bat='batcat'
alias df=duf
alias diff=colordiff
#alias fd='fd --hidden'
alias nv='neovide --multigrid --notabs'
alias ra=yazi
alias vim=nvim
alias v=nvim
alias watch=viddy
alias ugu='ug -Q -. --view=nvim'

# # single character shortcuts - be sparing!
# alias _='sudo'
alias c='clear'
#alias d='dirs -v | head -10'  # using d for "dorothy"
# alias v='vim'
alias h='history'

# fix typos
alias quit='exit'

# tools
alias te="${EDITOR-}"
alias ide="${VISUAL-}"

# # network
# alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
# alias iplocal="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
# alias dnsflush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias speedtest="wget -O /dev/null http://speed.transip.nl/10mb.bin"
# alias pinging="command ping"

# # other aliases
# alias tarls="tar -tvf"
# alias untar="tar -xf"
# alias biggest='du -s ./* | sort -nr | awk '\''{print $2}'\'' | xargs du -sh'
# alias dux='du -x --max-depth=1 | sort -n'
# alias path='echo -e ${PATH//:/\\n}'
# alias linecount="grep -c '^'"
# alias ds="date +%Y%m%d"
# alias ts="date +%Y%m%d%H%M%S"
# alias timestamp="date '+%Y-%m-%d %H:%M:%S'"
# alias datestamp="date '+%Y-%m-%d'"
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias dud='du -d 1 -h'
alias duf='du -sh *'

## Kubernetes aliases
alias kconf='__create_separate_kubeconfig.sh'
alias kdump='kubectl get all --all-namespaces'
alias kaf='kubectl apply -f'
alias kdf='kubectl delete -f'
alias kstart='~/dev/dotfiles/scripts/__kind_manager.sh --start'
alias kstop='~/dev/dotfiles/scripts/__kind_manager.sh --stop'

# Other
alias aopa='~/dev/dotfiles/scripts/__toggle_alacritty_opacity.sh'
alias atheme='~/dev/dotfiles/scripts/__swap_alacritty_theme.sh'
alias adit='vim ~/.config/dorothy/sources/aliases.sh'
alias abit='vim ~/.zsh_abbreviations'
#alias ai='/home/ai/aicmd' #todo
alias clock="__clock.sh &"
alias dca='mux s dca'
alias dev='cd ~/dev'
alias loft='cd ~/loft'
alias disk='gdu'
alias dots='cd ~/dev/dotfiles && lg'
alias fdit='vim ~/.zsh_functions'
alias gcc='git diff --stat --cached origin/master' # Git Check Commit before pushing
alias gs='git show'
alias lvim='nvim -c "normal '\''0"'
alias rm='rm -v'
alias sr='omz reload'
alias tedit='vim ~/.tmux.conf'
alias vn='nvim /tmp/temp-$RANDOM.md'
alias zedit='vim ~/.zshrc'
alias dedit='direnv edit'
# PROJECT: project
alias pedit='nvim ~/projects.txt'
alias zo='zoxide'

# pbcopy / pbpaste
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
