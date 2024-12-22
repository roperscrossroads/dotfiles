#!/usr/bin/env bash
# do not use `export` keyword in this file:
# shellcheck disable=SC2034

# Used by `setup-environment-commands`

TERMINAL_EDITORS=(
	'nvim'  # setup-util-neovim
	'vim'   # setup-util-vim
	'vi'
	'nano' # setup-util-nano
	'micro' # setup-util-micro (18k stars)
	'emacs' # setup-util-emacs (3k stars)
	'amp'   # setup-util-amp (3k stars)
	'ne'    # setup-util-ne (300 stars)
)
GUI_EDITORS=(
	'code' # setup-util-vscode
	'zed'  # https://zed.dev
	'atom'
	'subl'
	'gedit'             # linux default
	'gnome-text-editor' # fedora default
	'TextEdit'          # macos default
)

