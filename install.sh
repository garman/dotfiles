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
    exuberant-ctags \
    tmux \
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
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
# ln -s $(pwd)/vimrc $HOME/.vimrc
ln -s $(pwd)/vim $HOME/.vim

rm -f $HOME/.zshrc
ln -s $(pwd)/zshrc $HOME/.zshrc
ln -s $(pwd)/gitmessage $HOME/.gitmessage
ln -s $(pwd)/gitconfig $HOME/.gitconfig
ln -s $(pwd)/bash_profile $HOME/.bash_profile
mkdir -p $HOME/.config/gh
ln -s $(pwd)/gh_config.yml $HOME/.config/gh/.config.yml
git config commit.gpgsign true

rm -rf $HOME/.config
mkdir $HOME/.config
ln -s "$(pwd)/config/nvim" "$HOME/.config/nvim"

### Install vim-plug
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

### Install NeoVim plugins
# nvim --headless +PlugInstall +qa

HEADLESS_NEOVIM=1 /usr/local/bin/nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

mv garman.zsh-theme ~/.oh-my-zsh/themes/

sudo chsh -s "$(which zsh)" "$(whoami)"
