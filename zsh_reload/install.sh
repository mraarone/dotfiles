#!/bin/zsh

set -e

# . $(readlink -f ~/.zshrc)
echo $SHELL
autoload omz
# functions -t 
#::omz reload
$ZSH/tools/upgrade.sh
# omz update --unattended
echo "alright"
# omz update --unattended
