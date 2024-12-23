#!/usr/bin/env bash
# do not use `export` keyword in this file:
# shellcheck disable=SC2034

# load the dorothy defaults
source "$DOROTHY/config/setup.bash"
# APK
# Used by `setup-linux`
# APK_INSTALL=()

# Apt / apt-get
# Used by `setup-linux`
# APT_UNINSTALL=()
APT_INSTALL=(
	autoconf
	cmatrix
	colordiff
	cowsay
	direnv
	encfs
	entr
	expect
	fd-find
	figlet
	fortune
	gcc
	gnome-keyring
	htop
	inotify-tools
	libgraph-easy-perl
	locate
	lolcat
	mc
	mtr
	ncdu
	pandoc
	patch
	podman-compose
	poppler-utils
	pydf
	python3-setuptools
	ranger
	stow
	tmux
	traceroute
	wl-clipboard
	wmctrl
	xclip
	xsel
)

# AUR / pamac / pacman / yay / paru / pakku / aurutils
# Used by `setup-linux`
# AUR_INSTALL=()

# Flatpak
# Used by `setup-linux`
# FLATPAK_INSTALL=()

# RPM / dnf / yum
# Used by `setup-linux`
RPM_INSTALL=(
	autoconf
	cmatrix
	colordiff
	cowsay
	direnv
	dnf-plugins-core
	duf
	encfs
	entr
	expect
	fd-find
	figlet
	fortune
	gcc
	htop
	inotify-tools
	libgraph-easy-perl
	locate
	lolcat
	mc
	mtr
	ncdu
	pandoc
	patch
	podman-compose
	poppler-utils
	pydf
	python3-setuptools
	stow
	tmux
	wl-clipboard
	wmctrl
	xclip
	xsel
)

# Snap
# Used by `setup-linux`
# SNAP_INSTALL=()

# Zypper
# Used by `setup-linux`
# ZYPPER_INSTALL=()

# macOS App Store / mas / https://github.com/mas-cli/mas
# Used by `setup-mac-appstore`
# You can use `mas list` and `mas search` to find apps
# MAS_INSTALL=() # tupe array of id, label
# MAS_UPGRADE='no'

# Homebrew / brew / https://brew.sh
# Used by `setup-mac-brew`
# You can use `setup-mac-brew --configure` to configure some of these.
# HOMEBREW_UNTAPS=()
# HOMEBREW_TAPS=()
# HOMEBREW_FORMULAS=(
# 	diff-so-fancy
# 	direnv
# 	figlet
# 	findutils
# 	git-extras
# 	gpg-tui
# 	lazygit
# 	lua
# 	luarocks
# 	neofetch
# 	ranger
# 	readline
# 	tmux
# )

# HOMEBREW_SLOW_FORMULAS=(
#   gpg
#   shellcheck
# )
# HOMEBREW_CASKS=(
#   'breaktimer'
#   'discord'
#   'kitty'
#   'obsidian'
#   'qutebrowser'
#   'thefuck'
# )

# Rust / Cargo / Crates.io
# Used by `setup-rust`
CARGO_INSTALL=(
  ttyper
  ast-grep
  stylua
  bob-nvim
)

# HOMEBREW_FONTS=(
# 	'font-cantarell'
# 	'font-cascadia-code'
# 	'font-fira-code'
# 	'font-fira-code-nerd-font'
# 	'font-fira-mono'
# 	'font-fira-mono-nerd-font'
# 	'font-hack' # many editors require this
# 	'font-hasklig'
# 	'font-ibm-plex' # many editors require this
# 	'font-inconsolata-go-nerd-font'
# 	'font-inter' # many apps require this
# 	'font-jetbrains-mono'
# 	'font-jetbrains-mono-nerd-font'
# 	'font-lato'
# 	'font-maven-pro'
# 	'font-monoid'
# 	'font-montserrat'
# 	'font-open-sans'
# 	'font-oxygen'
# 	'font-oxygen-mono'
# 	'font-roboto'
# 	'font-roboto-mono'
# 	'font-source-code-pro' # many editors require this
# 	'font-ubuntu'
# )

# HOMEBREW_UNINSTALL=()        # for casks and formulas
# HOMEBREW_ENCODING_INSTALL='' # '', 'yes', 'no'

# Golang / go
# Used by `setup-go`
# GO_LINTING_INSTALL='' # '', 'yes', 'no'
# GO_INSTALL=()

# Node.js
# Used by `setup-node`
# NPM_INSTALL=()
# NODE_VERSIONS=()

# Python
# Used by `setup-python`
# PYTHON_INSTALL=()
# PIP_INSTALL=()
# PYTHON2_PIP_INSTALL=()
# PYTHON3_PIP_INSTALL=()
# PIPX_INSTALL=()

# Ruby
# Used by `setup-ruby`
# GEM_INSTALL=()



# Utilities to install, these are the [setup-util-*] scripts
# Used by `setup-utils`
# You can use `setup-utils --configure` to configure these.
SETUP_UTILS=(
	1password-cli
	alacritty
	aria2
	bash
	bat
	bottom
	carapace
	coreutils
	curl
	delta
	deno
	devel
	eza
	fd
	fish
	flatpak
	fzf
	gh
	git
	gocryptfs
	gpg
	grex
	gsed
	jq
	moreutils
	nano
	neovim
	nu
	prettier
	python
	ripgrep
	sd
	shellcheck
	sshd
	starship
	strongbox
	tealdeer
	teip
	tokei
	tree
	unziptar
	vhs
	vim
	vscode
	wget
	zoxide
	zsh
)
