#!/usr/bin/env zsh

set -e

# Check if using GitHub Codespaces
if [ -f ${HOME}/.vscode-remote/data/Machine/settings.json ]; then
  mkdir --parents "${HOME}/.vscode-remote/data/Machine/"
  ln -sf "${DOTFILES_LOCATION}/vscode/settings.json" "${HOME}/.vscode-remote/data/Machine/settings.json"
  ln -sf "${DOTFILES_LOCATION}/vscode/keybindings.json" "${HOME}/.vscode-remote/data/Machine/keybindings.json"
# Check if using a PC
elif [ -f ${HOME}/.config/Code/User/settings.json ]; then
  mkdir --parents "${HOME}/.config/Code/User/"
  ln -sf "${DOTFILES_LOCATION}/vscode/settings.json" "${HOME}/.config/Code/User/settings.json"
  ln -sf "${DOTFILES_LOCATION}/vscode/keybindings.json" "${HOME}/.config/Code/User/keybindings.json"
# Check if using a Mac
elif [ -f ${HOME}/Library/Application\ Support/Code/User/settings.json ]; then
  mkdir --parents "${HOME}/Library/Application Support/Code/User"
  ln -sf "${DOTFILES_LOCATION}/vscode/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"
  ln -sf "${DOTFILES_LOCATION}/vscode/keybindings.json" "${HOME}/Library/Application Support/Code/User/keybindings.json"
fi


CODE_EXTENSIONS=(
  "bierner.markdown-mermaid"
  "DavidAnson.vscode-markdownlint"
  "eamodio.gitlens"
  "GitHub.copilot"
  "GitHub.remotehub"
  "hashicorp.terraform"
  "mintlify.document"
  "GitHub.vscode-pull-request-github"
  "ms-vscode.makefile-tools"
  "ms-python.python"
  "ms-python.vscode-pylance"
  "mechatroner.rainbow-csv"
  "ms-python.python"
  "oderwat.indent-rainbow"
  "redhat.vscode-yaml"
  "streetsidesoftware.code-spell-checker"
  "SonarSource.sonarlint-vscode"
  "Tyriar.sort-lines"
)
for ext in "${CODE_EXTENSIONS[@]}"; do printf "installing %s\n" "${ext}" && /usr/local/bin/code --install-extension "${ext}" --force; done
