#!/bin/sh

set -e

###
# Installation of packages, configurations, and dotfiles.
###
if [ $CODESPACES ]; then \
    DOTFILES_LOCATION=/workspaces/.codespaces/.persistedshare/dotfiles/
else DOTFILES_LOCATION=${HOME}/dotfiles/
fi

export DOTFILES_LOCATION;

###
# Change time zone
###
sudo ln -fs /usr/share/zoneinfo/America/Chicago /etc/localtime
sudo /usr/sbin/dpkg-reconfigure --frontend noninteractive tzdata

###
# Install dependencies
###
omz_plugins() {
    if [ -d ${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then rm -rf ${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions; fi
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    if [ -d ${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then rm -rf ${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; fi
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    if [ -d ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k ]; then rm -rf ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k; fi
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

#./bin/dotfiles install starship
${DOTFILES_LOCATION}/bin/dotfiles install zsh
${DOTFILES_LOCATION}/bin/dotfiles install omz
omz_plugins
${DOTFILES_LOCATION}/bin/dotfiles install powerlevel10k
${DOTFILES_LOCATION}/bin/dotfiles install vscode
${DOTFILES_LOCATION}/bin/dotfiles install dircolors
${DOTFILES_LOCATION}/bin/dotfiles install fluxbox
#./bin/dotfiles install brew
#./bin/dotfiles install git
${DOTFILES_LOCATION}/bin/dotfiles install github
##./bin/dotfiles install node
##./bin/dotfiles install mongodb
{$DOTFILES_LOCATION}/bin/dotfiles install tmux
#./bin/dotfiles install vim
