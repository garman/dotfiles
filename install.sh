#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

sudo apt-get --assume-yes install silversearcher-ag fuse ripgrep universal-ctags

# install latest neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

# Install tmux
wget https://github.com/nelsonenzo/tmux-appimage/releases/download/3.2a/tmux.appimage
sudo chmod u+x tmux.appimage
sudo mv tmux.appimage /usr/local/bin/tmux

# Install node 22
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install 22

# Config git and gh
ln -sf $(pwd)/gitconfig $HOME/.gitconfig
mkdir -p $HOME/.config/gh
ln -s $(pwd)/gh_config.yml $HOME/.config/gh/.config.yml
scripts/install_gh_extensions.sh

# Move various dotfiles to various places
ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/vim $HOME/.vim
rm -f $HOME/.zshrc
ln -s $(pwd)/zshrc $HOME/.zshrc
cp garman.zsh-theme ~/.oh-my-zsh/themes/

# Config nvim
rm -rf $HOME/.config
mkdir $HOME/.config
ln -s "$(pwd)/config/nvim" "$HOME/.config/nvim"
HEADLESS_NEOVIM=1 /usr/local/bin/nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

sudo chsh -s "$(which zsh)" "$(whoami)"
