#!/usr/bin/env zsh

set -e

DIRCOLORS_PROFILE="dircolors.ansi-dark"
DIRCOLORS_FILE="${HOME}/.dir_colors"

# Choose to use file or a folder for dircolors is the best way to ensure it works
if [[ -d ${HOME}/.dir_colors ]]; then
    DIRCOLORS_FILE="${HOME}/dir_colors/${DIRCOLORS_PROFILE}"
elif [[ -f ${HOME}/.dir_colors ]]; then
    mv -f --backup=numbered ${HOME}/.dir_colors ${HOME}/.dir_colors.bak
fi

# Link the dircolors file
ln -sf "${DOTFILES_LOCATION}/dircolors/${DIRCOLORS_PROFILE}" "${DIRCOLORS_FILE}"

# Set the color scheme
eval `dircolors "${DIRCOLORS_FILE}"`

# Set up ls to use the color scheme
alias ls='ls --color=auto'

# Make completion use the same color scheme
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
