#!/usr/bin/env zsh

set -e

ln -sf "${DOTFILES_LOCATION}/vscode/settings.json" "$HOME/.config/Code/User/settings.json"
ln -sf "${DOTFILES_LOCATION}/vscode/keybindings.json" "$HOME/.config/Code/User/keybindings.json"

CODE_EXTENSIONS=(
  DavidAnson.vscode-markdownlint
  dbaeumer.vscode-eslint
  eamodio.gitlens
  esbenp.prettier-vscode
  # felixfbecker.php-intellisense
  github.remotehub
  github.vscode-pull-request-github
  golang.go
  hashicorp.terraform
  ms-azuretools.vscode-docker
  ms-vscode-remote.remote-containers
  ms-python.python
  sdras.night-owl
  streetsidesoftware.code-spell-checker
  # timonwong.shellcheck
  Tyriar.sort-lines
)
for ext in "${CODE_EXTENSIONS[@]}"; do printf "installing %s\n" "${ext}" && code --install-extension "${ext}" --force; done
