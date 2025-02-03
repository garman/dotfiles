#!/bin/bash

output() {
  printf "$1"
}

all_done() {
  if [[ "$1" ]]; then printf "$1"
  else
    printf "✅\n"
  fi
}

brew_bundle() {
  output "Brew bundling...\n"

  brew bundle

  all_done "\n\n"
}

install_xcode_select() {
  output "Conditionally installing xcode-select..."

  (type xcode-select >&- && xpath=$( xcode-select --print-path ) &&
    test -d "${xpath}" && test -x "${xpath}") || xcode-select --install

  all_done
}

install_dotfiles() {
  output "Installing dotfiles..."

  dotfiles=(
    config/nvim
    gitconfig
    tmux.conf
    zshrc
  )

  for val in "${dotfiles[@]}"; do
    ln -snf $(pwd)/$val $HOME/.$val
  done

  ln -snf $(pwd)/garman.zsh-theme ~/.oh-my-zsh/themes/

  all_done
}

install_npm_packages() {
  output "Conditionally installing npm packages..."

  npm_packages_needed=(
    neovim
  )
  npm_packages_not_installed=()

  for pkg in "${npm_packages_needed[@]}"; do
    npm list --depth 1 --global $pkg >/dev/null 2>&1 || npm_packages_not_installed+=($pkg)
  done

  [ ${#npm_packages_not_installed[@]} -eq 0 ] || /usr/local/bin/npm install -g "${npm_packages_not_installed[@]}"

  all_done
}

initialize_neovim() {
  output "Initializing neovim..."

  HEADLESS_NEOVIM=1 /usr/local/bin/nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

  all_done
}

install_fzf() {
  output "Conditionally installing fzf..."

  command -v fzf >/dev/null 2>&1 || $(brew --prefix)/opt/fzf/install --all

  all_done
}

teardown() {
  output "Cleaning up..."

  IFS=$' \t\n'

  all_done
}

brew_bundle

install_dotfiles

install_xcode_select
install_npm_packages
install_fzf

initialize_neovim
scripts/install_gh_extensions.sh

# ❯ wget -P ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml
# https://marketplace.visualstudio.com/items?itemName=be5invis.vscode-custom-css


teardown
