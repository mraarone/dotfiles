#!/bin/sh

set -e

echo "Running dotfiles install.sh, logging to /tmp/dotfilesLog.txt"

#exec 3>&1 4>&2
#trap 'exec 2>&4 1>&3' 0 1 2 3
#exec 1>/tmp/dotfilesLog.txt 2>&1
## Everything below will go to the file 'dotfilesLog.txt':

###
# Installation of packages, configurations, and dotfiles.
###
if [ $CODESPACES ]; then \
    echo "Dealing with Codespaces, using codespaces dotfiles location...";
    DOTFILES_LOCATION=/workspaces/.codespaces/.persistedshare/dotfiles;
else
    echo "Dealing with a non-Codespaces environment, like vscode...";
    DOTFILES_LOCATION=${HOME}/dotfiles;
fi

export DOTFILES_LOCATION=$DOTFILES_LOCATION;
cd $DOTFILES_LOCATION;

###
# Change time zone
###
sudo ln -fs /usr/share/zoneinfo/America/Chicago /etc/localtime
sudo /usr/sbin/dpkg-reconfigure --frontend noninteractive tzdata

#${DOTFILES_LOCATION}/bin/dotfiles install starship
${DOTFILES_LOCATION}/bin/dotfiles install_silent zsh
${DOTFILES_LOCATION}/bin/dotfiles install_silent omz
${DOTFILES_LOCATION}/bin/dotfiles install_silent powerlevel10k
${DOTFILES_LOCATION}/bin/dotfiles install_silent zsh_reload
#${DOTFILES_LOCATION}/bin/dotfiles install_silent vscode
#${DOTFILES_LOCATION}/bin/dotfiles install_silent dircolors
${DOTFILES_LOCATION}/bin/dotfiles install_silent fluxbox
#${DOTFILES_LOCATION}/bin/dotfiles install_silent brew
#${DOTFILES_LOCATION}/bin/dotfiles install_silent git
#${DOTFILES_LOCATION}/bin/dotfiles install_silent tmux
#${DOTFILES_LOCATION}/bin/dotfiles install_silent vim
#${DOTFILES_LOCATION}/bin/dotfiles install_silent node
#${DOTFILES_LOCATION}/bin/dotfiles install_silent mongodb
#${DOTFILES_LOCATION}/bin/dotfiles install github
