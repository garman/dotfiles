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
    fuse \
    ripgrep \
    libfuse2"

if ! dpkg -s ${PACKAGES_NEEDED} > /dev/null 2>&1; then
    if [ ! -d "/var/lib/apt/lists" ] || [ "$(ls /var/lib/apt/lists/ | wc -l)" = "0" ]; then
        sudo apt-get update
    fi
    sudo echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
    sudo apt-get -y -q install ${PACKAGES_NEEDED}
fi

sudo apt-get --assume-yes install silversearcher-ag fuse

# Install node 22
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install 22

# install latest neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

# Install tmux
wget https://github.com/nelsonenzo/tmux-appimage/releases/download/3.2a/tmux.appimage
sudo chmod u+x tmux.appimage
sudo mv tmux.appimage /usr/local/bin/tmux

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
