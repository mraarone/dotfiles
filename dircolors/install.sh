#!/usr/bin/env zsh

set -e

mkdir --parent ${HOME}/.dir_colors
ln -sf "${DOTFILES_LOCATION}/dircolors/dircolors.ansi-dark" "${HOME}/.dir_colors/dircolors.ansi-dark"
