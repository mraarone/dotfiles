#!/usr/bin/env zsh

set -e

# I know, this doesn't follow you only say it once...
if [ -d "${HOME}/.fluxbox" ]; then
  printf "User already has a .fluxbox directory in their home, but we are going to squash it anyways.\n"
  rm -rf "${HOME}/.fluxbox.bak"
  mv -f "${HOME}/.fluxbox" "${HOME}/.fluxbox.bak"
  cp -Rf "${DOTFILES_LOCATION}/fluxbox/.fluxbox" "${HOME}/.fluxbox"
else
  ln -sf "${DOTFILES_LOCATION}/fluxbox/.fluxbox" "${HOME}/.fluxbox"
fi

if [ -f "${HOME}/.Xmodmap" ]; then
  printf "User already has an .Xmodmap file in their home.\n"
  rm -rf "${HOME}/.Xmodmap.bak"
  mv -f "${HOME}/.Xmodmap" "${HOME}/.Xmodmap.bak"
  cp -Rf "${DOTFILES_LOCATION}/fluxbox/.Xmodmap" "${HOME}/.Xmodmap"
else
  ln -sf "${DOTFILES_LOCATION}/fluxbox/.Xmodmap" "${HOME}/.Xmodmap"
fi
