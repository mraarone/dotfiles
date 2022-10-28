#!/usr/bin/env zsh

set -e

# .p10k.zsh.bars
# .p10k.zsh.ice
# .p10k.zsh.lean
p10k_theme=".p10k.zsh.bars"

ln -sf "${DOTFILES_LOCATION}/powerlevel10k/${p10k_theme}" "${HOME}/.p10k.zsh"

function p10k reload
