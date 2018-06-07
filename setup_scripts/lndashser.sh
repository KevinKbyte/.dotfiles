#!/usr/bin/env bash

install() {
    if hash pacman 2>/dev/null; then
        sudo pacman -S rclone rsync git zsh netctl netstat chromium gvim neovim wget curl xclip xsel pip
    elif hash apt-get 2>/dev/null; then
        sudo apt-get install rclone rsync git zsh chromium-browser xclip xsel i3-wm i3-blocks xdotool htop rofi wireshark blender python-pip curl tmux pip

        # vim dependencies
        sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
        libgtk2.0-dev libtk1.0-dev libbonoboui2-dev \
        libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
        python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git

        # light dependencies
        sudo apt install help2man

        # virtualenv
        sudo apt install virtualenvwrapper
        pip install virtualenv virtualenvwrapper
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
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        

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
        [Yy]* ) install; lns; break;;
        [Nn]* ) lns; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
