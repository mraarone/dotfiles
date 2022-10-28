#!/bin/zsh

set -e

# . $(readlink -f ~/.zshrc)
echo $SHELL
autoload omz
# functions -t 
omz reload
# omz update --unattended
echo "alright"
# omz update --unattended
