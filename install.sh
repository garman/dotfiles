#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

# Install curl, tar, git, other dependencies if missing
PACKAGES_NEEDED="\
    bat \
    fuse \
    dialog \
    apt-utils \
    libfuse2"

if ! dpkg -s ${PACKAGES_NEEDED} > /dev/null 2>&1; then
    if [ ! -d "/var/lib/apt/lists" ] || [ "$(ls /var/lib/apt/lists/ | wc -l)" = "0" ]; then
        sudo apt-get update
    fi
    sudo echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
    sudo apt-get -y -q install ${PACKAGES_NEEDED}
fi

sudo apt-get --assume-yes install silversearcher-ag fuse

# install latest neovim
sudo modprobe fuse
sudo groupadd fuse
sudo usermod -a -G fuse "$(whoami)"
# wget https://github.com/neovim/neovim/releases/download/v0.5.1/nvim.appimage
wget https://github.com/github/copilot.vim/releases/download/neovim-nightlies/appimage.zip
unzip appimage.zip
sudo chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

# Install tmux
wget https://github.com/nelsonenzo/tmux-appimage/releases/download/3.2a/tmux.appimage
sudo chmod u+x tmux.appimage
sudo mv tmux.appimage /usr/local/bin/tmux

ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/vimrc $HOME/.vimrc
ln -s $(pwd)/vim $HOME/.vim
ln -s $(pwd)/emacs $HOME/.emacs
ln -s $(pwd)/screenrc $HOME/.screenrc
rm -f $HOME/.zshrc
ln -s $(pwd)/zshrc $HOME/.zshrc
ln -s $(pwd)/gitmessage $HOME/.gitmessage
ln -s $(pwd)/gitconfig $HOME/.gitconfig
mkdir -p $HOME/.config/gh
ln -s $(pwd)/gh_config.yml $HOME/.config/gh/.config.yml
ln -s $(pwd)/bash_profile $HOME/.bash_profile
git config commit.gpgsign true

rm -rf $HOME/.config
mkdir $HOME/.config
ln -s "$(pwd)/config/nvim" "$HOME/.config/nvim"

git clone https://github.com/nodenv/node-build.git /usr/local/.nodenv/plugins/node-build
nodenv install 16.0.0

nvim +'PlugInstall --sync' +qa

vim -Es -u $HOME/.vimrc -c "PlugInstall | qa"

mv garman.zsh-theme ~/.oh-my-zsh/themes/

sudo chsh -s "$(which zsh)" "$(whoami)"

# exec > >(tee -i $HOME/dotfiles_install.log)
# exec 2>&1
# set -x
#
# ln -s $(pwd)/vimrc $HOME/.vimrc
# ln -s $(pwd)/vim $HOME/.vim
# ln -s $(pwd)/gitmessage $HOME/.gitmessage
# mkdir -p $HOME/.config/gh
# ln -s $(pwd)/gh_config.yml $HOME/.config/gh/.config.yml
# rm -f $HOME/.zshrc
# ln -s $(pwd)/zshrc $HOME/.zshrc
# ln -s $(pwd)/bash_profile $HOME/.bash_profile
#
# sudo apt-get --assume-yes install silversearcher-ag bat
# vim -Es -u $HOME/.vimrc -c "PlugInstall | qa"
#
# sudo chsh -s "$(which zsh)" "$(whoami)"
