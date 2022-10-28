#!/usr/bin/env zsh

set -e

DIRCOLORS_PROFILE="dircolors.ansi-dark"
DIRCOLORS_FILE="${HOME}/.dir_colors"

if [[ -d ${HOME}/.dir_colors ]]; then
    DIRCOLORS_FILE="${HOME}/dir_colors/${DIRCOLORS_PROFILE}"
elif [[ -f ${HOME}/.dir_colors ]]; then
    mv -f --backup=numbered ${HOME}/.dir_colors ${HOME}/.dir_colors.bak
fi

ln -sf "${DOTFILES_LOCATION}/dircolors/${DIRCOLORS_PROFILE}" "${DIRCOLORS_FILE}"

eval `dircolors "${DIRCOLORS_FILE}"`

alias ls='ls --color=auto'
