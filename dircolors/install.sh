#!/usr/bin/env zsh

set -e

mkdir --parent ${HOME}/.dircolors
ln -sf "${DOTFILES_LOCATION}/dircolors/dircolors.ansi-dark" "${HOME}/.dircolors/dircolors.ansi-dark"
