#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

PACKAGES_NEEDED="\
    bat \
    fuse \
    dialog \
    apt-utils \
    universtal-ctags \
    tmux \
    silversearch-ag \
    ripgrep \
    fd-find \
    libfuse2"

if ! dpkg -s ${PACKAGES_NEEDED} >/dev/null 2>&1; then
  if [ ! -d "/var/lib/apt/lists" ] || [ "$(ls /var/lib/apt/lists/ | wc -l)" = "0" ]; then
    sudo apt-get update
  fi
  sudo echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
  sudo apt-get -y -q install ${PACKAGES_NEEDED}
fi

sudo apt-get --assume-yes install silversearcher-ag fuse python3-neovim ripgrep fd-find

# Install node 22
source /usr/local/share/nvm/nvm.sh
nvm install 22

# Install fzf
rm -rf $HOME/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install --all

# neovim
sudo modprobe fuse
sudo groupadd fuse
sudo usermod -a -G fuse "$(whoami)"
wget https://github.com/neovim/neovim/releases/download/v0.11.0/nvim.appimage
sudo chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

# tmux
wget https://github.com/nelsonenzo/tmux-appimage/releases/download/3.2a/tmux.appimage
sudo chmod u+x tmux.appimage
sudo mv tmux.appimage /usr/local/bin/tmux
mkdir -p "$HOME/.tmux"
git clone https://github.com/catppuccin/tmux "$HOME/.tmux/catppuccin"

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

# Set up config directory
rm -rf $HOME/.config
mkdir $HOME/.config

# Config git and gh
ln -sf $(pwd)/gitconfig $HOME/.gitconfig
mkdir -p $HOME/.config/gh
ln -s $(pwd)/gh_config.yml $HOME/.config/gh/.config.yml
scripts/install_gh_extensions.sh

# Move various dotfiles to various places
ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/config/alacritty/alacritty.toml $HOME/.config/alacritty/alacritty.toml
ln -s $(pwd)/vim $HOME/.vim
ln -sf $(pwd)/zshrc $HOME/.zshrc

# Config nvim
ln -s "$(pwd)/config/nvim" "$HOME/.config/nvim"
nvim --headless "+Lazy! sync" +qa

# Init lazygit
mkdir -p $HOME/.config/lazygit
touch $HOME/.config/lazygit/config.yml

# Prompt
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

sudo chsh -s "$(which zsh)" "$(whoami)"
