#!/usr/bin/env zsh

set -e

# Install GitHub CLI via https://github.com/cli/cli/blob/trunk/docs/install_linux.md
install_github () {
    type -p curl >/dev/null || sudo apt install curl -y
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y
}

# Install GitHub CLI if it doesn't exist
if [[ -z $(command -v gh) ]]; then
    install_github
fi

gh auth login

# Installation of gh-dash
gh extension install dlvhdr/gh-dash || true

# Upgrade all extensions
gh extension upgrade --all

# Config
ln -sf "${DOTFILES_LOCATION}/github/gh-dash.yml" "${HOME}/.config/gh-dash/config.yml"
