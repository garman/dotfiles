#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

ln -s $(pwd)/vimrc $HOME/.vimrc
ln -s $(pwd)/vim $HOME/.vim
ln -s $(pwd)/gitmessage $HOME/.gitmessage
mkdir -p $HOME/.config/gh
ln -s $(pwd)/gh_config.yml $HOME/.config/gh/.config.yml
rm -f $HOME/.zshrc
ln -s $(pwd)/zshrc $HOME/.zshrc
ln -s $(pwd)/bash_profile $HOME/.bash_profile

sudo apt-get --assume-yes install silversearcher-ag bat
vim -Es -u $HOME/.vimrc -c "PlugInstall | qa"

sudo chsh -s "$(which zsh)" "$(whoami)"
