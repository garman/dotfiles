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
    libfuse2"

if ! dpkg -s ${PACKAGES_NEEDED} > /dev/null 2>&1; then
    if [ ! -d "/var/lib/apt/lists" ] || [ "$(ls /var/lib/apt/lists/ | wc -l)" = "0" ]; then
        sudo apt-get update
    fi
    sudo echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
    sudo apt-get -y -q install ${PACKAGES_NEEDED}
fi

sudo apt-get --assume-yes install silversearcher-ag fuse python3-neovim ripgrep

# Install node 22
source /usr/local/share/nvm/nvm.sh
nvm install 22

# Install fzf
rm -rf $HOME/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install --all

# Install neovim
sudo modprobe fuse
sudo groupadd fuse
sudo usermod -a -G fuse "$(whoami)"
wget https://github.com/neovim/neovim/releases/download/v0.10.1/nvim.appimage
sudo chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

# Install tmux and tpm
wget https://github.com/nelsonenzo/tmux-appimage/releases/download/3.2a/tmux.appimage
sudo chmod u+x tmux.appimage
sudo mv tmux.appimage /usr/local/bin/tmux
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux

# Config git and gh
ln -sf $(pwd)/gitconfig $HOME/.gitconfig
mkdir -p $HOME/.config/gh
ln -s $(pwd)/gh_config.yml $HOME/.config/gh/.config.yml
scripts/install_gh_extensions.sh

# Move various dotfiles to various places
ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/config/alacritty/alacritty.toml $HOME/.config/alacritty/alacritty.toml
ln -s $(pwd)/config/alacritty/themes/rose-pine-moon.toml $HOME/.config/alacritty/themes/rose-pine-moon.toml
ln -s $(pwd)/vim $HOME/.vim
rm -f $HOME/.zshrc
ln -s $(pwd)/zshrc $HOME/.zshrc

# Config nvim
rm -rf $HOME/.config
mkdir $HOME/.config
ln -s "$(pwd)/config/nvim" "$HOME/.config/nvim"
HEADLESS_NEOVIM=1 /usr/local/bin/nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

#fpath+=($HOME/.zsh/pure)
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

sudo chsh -s "$(which zsh)" "$(whoami)"
