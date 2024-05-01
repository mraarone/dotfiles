#!/bin/zsh

### This made poopie ! /usr/bin/env zsh

###
# Set the flag to fail and immediately exit on Consequences of Shell Errors
###
set -e

###
# Install Oh-My-Zsh if it doesn't exist
###
omz_install () {
    echo "Installing Oh-My-Zsh!..."

    if [ -d "${HOME}/.oh-my-zsh" ]; then
      printf "oh-my-zsh is already installed\n"
    else
      sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
      export ZSH=${HOME}/.oh-my-zsh
    fi
}

###
# Install dependencies
###
omz_plugin () {
    readonly plugin_name=${1:?"The plugin name must be specified and match the plugins folder name."}

    echo "Installing Oh-My-Zsh! plugin ${plugin_name}..."

    if [ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/${plugin_name} ]; then
        rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/${plugin_name}
    fi
    git clone https://github.com/zsh-users/${plugin_name} \
        ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/${plugin_name}
}

omz_theme_powerlevel10k () {
    readonly theme_name="powerlevel10k"

    echo "Installing Oh-My-Zsh! PowerLevel10k theme..."

    if [ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/${theme_name} ]; then
        rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/${theme_name}
    fi
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/${theme_name}

    echo "Finished installing Oh-My-Zsh! PowerLevel10k theme."
}

omz_custom_file () {
    readonly file_name=${1:?"The file name must be specified..."}

    echo "Installing Oh-My-Zsh! files ${file_name}..."

    if [[ ! ( -h "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/${file_name}" ) ]]; then
        ln -sf "${DOTFILES_LOCATION}/omz/${file_name}" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/${file_name}"
    fi
}

omz_customize () {
    omz_plugin "zsh-completions"
    omz_plugin "zsh-autosuggestions"
    omz_plugin "zsh-syntax-highlighting"
    omz_theme_powerlevel10k

    omz_custom_file "aliases.zsh"
    omz_custom_file "exports.zsh"
    omz_custom_file "functions.zsh"

    # Install Custom Themes or Plugins
    #ln -sf "${DOTFILES_LOCATION}/zsh/benmatselby.zsh-theme" "${HOME}/.oh-my-zsh/custom/themes/"
}

omz_reload () {
    function omz reload
}

###
# Main
###

omz_install
omz_customize
# omz_reload
