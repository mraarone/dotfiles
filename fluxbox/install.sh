#!/usr/bin/env zsh

set -e

# I know, this doesn't follow you only say it once...
if [ -d "${HOME}/.fluxbox" ]; then
  printf "User already has a .fluxbox directory in their home.\n"
else
  ln -sf "${DOTFILES_LOCATION}/.fluxbox" "${HOME}/.fluxbox"
fi

if [ -f "${HOME}/.Xmodmap" ]; then
  printf "User already has an .Xmodmap file in their home.\n"
else
  ln -sf "${DOTFILES_LOCATION}/.Xmodmap" "${HOME}/.Xmodmap"
fi
