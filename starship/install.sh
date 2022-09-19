#!/usr/bin/env zsh

set -e

curl -sS https://starship.rs/install.sh | sh -s -- -y 

mkdir --parents "${HOME}/.config"
ln -sf "${DOTFILES_LOCATION}/starship/starship.toml" "${HOME}/.config/starship.toml"
