#!/usr/bin/env bash

install() {
    if hash pacman 2>/dev/null; then
        sudo pacman -S rclone rsync git zsh netctl netstat chromium gvim neovim wget curl xclip xsel pip
    elif hash apt-get 2>/dev/null; then
        sudo apt-get install rclone rsync git zsh chromium-browser xclip xsel i3-wm xdotool htop rofi wireshark blender python-pip
    fi
}

lns() {
    cd ~
    DOTFILES=~/.dotfiles
    TMP=test_files
    if [ ~ -d ~/$TMP ]; then
        mkdir ~/$TMP
    fi

	if [ -d "$DOTFILES" ]; then
	    cd ~
	    ln -s ~/.dotfiles/zsh/.zshrc .
	    ln -s ~/.dotfiles/.tmux/.tmux.conf . 
	    ln -s ~/.dotfiles/i3/ ./.config/
	    ln -s ~/.dotfiles/tmuxinator/ .tmuxinator
	    ln -s ~/.dotfiles/tmuxinator/ .tmuxinator
	    ln -s ~/.dotfiles/.xbindkeysrc .
	    mkdir ~/.dotfiles/.vim/backup
	    mkdir ~/.dotfiles/.vim/swap
	    mkdir ~/.dotfiles/.vim/undo

	    ln -s ~/.dotfiles/.vim/.vimrc .
	    # Gets vim plug working
	    ln -s ~/.dotfiles/.vim .
        if [ ! -d ~/.oh-my-zsh ]; then
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        fi
        if [ ! -f ~/.vim/autoload/plug.vim ]; then
            curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        fi

        if hash rg 2>/dev/null; then
            cd ~/test_files

            cd ~
        fi
    fi

    while true; do
        read -p "Do you want to install virtualenvs?" yn
        case $yn in
            [Yy]* ) 
                    sudo pip install virtualenv virtualenv-wrapper
                    if type mkvirtualenv 2>/dev/null; then
                    mkvirtualenv -p /usr/bin/python3 py3
                    mkvirtualenv -p /usr/bin/python2 py2
                    fi
                    break;;
            [Nn]* ) break;;
            * ) echo "Please answer yes or no.";;
        esac
    done

	# ln -s 
	# ln -s 
	# cd /usr/bin/
	# sudo ln -s ~/.dotfiles/i3/alt-tab/i3-alt-tab .
}

while true; do
    read -p "Do you want to install starting programs?" yn
    case $yn in
        [Yy]* ) install; break;;
        [Nn]* ) lns; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
