#!/usr/bin/env bash
# do not use `export` keyword in this file:
# shellcheck disable=SC2034

# Used by `setup-shell`

USER_SHELLS=(
	zsh  # Z shell
	bash # bourne again shell
	fish # fish shell
	dash # debian almquist shell
	nu   # nushell
	elvish # elvish shell
	ksh    # korn shell
	xonsh  # python-powered shell
	ash  # almquist shell
	hush # hush, an independent implementation of a Bourne shell for BusyBox
	sh   # the operating-system symlinks this to any POSIX compliant shell
)
