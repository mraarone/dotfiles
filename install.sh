#!/usr/bin/env zsh

set -e

###
# Installation of packages, configurations, and dotfiles.
###
DOTFILES_LOCATION=$(pwd)
export DOTFILES_LOCATION;

###
# Change time zone
###
sudo ln -fs /usr/share/zoneinfo/America/Chicago /etc/localtime
sudo /usr/sbin/dpkg-reconfigure --frontend noninteractive tzdata

###
# Install dependencies
###
zshrc() {
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

zshrc

#./bin/dotfiles install starship
./bin/dotfiles install zsh
./bin/dotfiles install omz
./bin/dotfiles install powerlevel10k
./bin/dotfiles install vscode
./bin/dotfiles install dircolors
./bin/dotfiles install fluxbox
#./bin/dotfiles install brew
#./bin/dotfiles install git
#./bin/dotfiles install github
#./bin/dotfiles install node
#./bin/dotfiles install mongodb
#./bin/dotfiles install tmux
#./bin/dotfiles install vim
