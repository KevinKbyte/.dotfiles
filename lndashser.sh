#!/usr/bin/env bash

install() {
    if hash pacman 2>/dev/null; then
        sudo pacman -S rclone rsync git zsh netctl netstat chromium gvim neovim wget curl xclip xsel
    elif hash apt-get 2>/dev/null; then
        sudo apt-get install rclone rsync git zsh chromium xclip xsel
    fi
}

while true; do
    read -p "Do you want to install starting programs?" yn
    case $yn in
        [Yy]* ) install; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

cd ~
DOTFILES=.dotfiles

if [ ! -d "$DOTFILES" ]; then
    git clone https://github.com/KevinKbyte/.dotfiles

    ln -s ~/.dotfiles/zsh/.zshrc .
    ln -s ~/.dotfiles/.tmux/.tmux.conf . 
    ln -s ~/.dotfiles/i3/ ./.config/
    ln -s ~/.dotfiles/tmuxinator/ .tmuxinator
    ln -s ~/.dotfiles/tmuxinator/ .tmuxinator
    ln -s ~/.dotfiles/.xbindkeysrc .
    cd ~/.oh-my-zsh/lib/
    ln -s ~/.dotfiles/zsh/key-bindings.zsh .
    cd ~/.oh-my-zsh/themes
    ln -s ~/.dotfiles/zsh/kev.zsh-theme .
    cd ~
    mkdir ~/.dotfiles/.vim/backup
    mkdir ~/.dotfiles/.vim/swap
    mkdir ~/.dotfiles/.vim/undo

    ln -s ~/.dotfiles/.vim/.vimrc .
    # Gets vim plug working
    ln -s ~/.dotfiles/.vim .
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# ln -s 
# ln -s 
# cd /usr/bin/
# sudo ln -s ~/.dotfiles/i3/alt-tab/i3-alt-tab .
