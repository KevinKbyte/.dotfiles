#!/usr/bin/env bash

TMP=test_files
if [ ~ -d ~/$TMP ]; then
    mkdir ~/$TMP
fi

install() {
    if hash pacman 2>/dev/null; then
        sudo pacman -S rclone rsync git zsh netctl netstat chromium gvim neovim wget curl xclip xsel pip
    elif hash apt-get 2>/dev/null; then
        sudo apt-get install rsync git zsh chromium-browser xclip xsel xdotool htop wireshark blender python-pip curl tmux tmuxinator python3-pip docker steam vlc virtualbox
        
        # japanese keyboard
        sudo apt-get install ibus-anthy

        # i3-wm 
        sudo apt-get install i3-wm i3blocks rofi i3-wm-dbg

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

        # discord
        cd ~/Downloads
        rm discord*.deb
        wget https://discordapp.com/api/download?platform=linux&format=deb -O discord.deb
        sudo dpkg -i discord*.deb

        # komorebi
        # libgtop2-dev, libgtk-3-dev, gtk+-3.0 libgtop-2.0 glib-2.0>=2.38 gee-0.8 libwnck-3.0 clutter-gtk-1.0 clutter-1.0 clutter-gst-3.0 cmake valac

        # ranger
        sudo apt-get install ranger

        # clamav
        sudo apt-get install "clamav*"

        # xwinwrap
        # example: nice -n 15 xwinwrap -ni -nf -ov -sp -st -fs -b -s -o 1.000000 -- mplayer /home/kev/Pictures/cat.mp4 -quiet -noconsolecontrols -loop 0 -nosound -wid WID
        cd ~/.github/i3/
        sudo apt-get install xorg-dev build-essential libx11-dev x11proto-xext-dev libxrender-dev libxext-dev mplayer
        git clone https://github.com/ujjwal96/xwinwrap.git
        cd xwinwrap
        make
        sudo make install
        make clean

        # Install qutebrowser
        sudo apt-get install tox
        cd $TMP
        git clone https://github.com/qutebrowser/qutebrowser.git
        cd qutebrowser
        tox -e mkvenv-pypi

        # jq for i3 move resize script to work
        sudo apt-get install sqlite3 jq

        sudo apt-get install calcurse

        # to make directories for mpd and ncmpcpp
        touch ~/.config/mpd/log ~/.config/mpd/pid ~/.config/mpd/sticker.sql ~/.config/mpd/state
        mkdir -p ~/.config/mpd/playlists ~/.config/ncmpcpp/lyrics/

        cd ~
    fi
}

lns() {
    cd ~
    DOTFILES=~/.dotfiles

	if [ -d "$DOTFILES" ]; then
	    cd ~
        cd /etc/profile.d
        sudo ln -s ~/.dotfiles/i3/scripts/.scripts/mystart .
	    ln -s ~/.dotfiles/zsh/.zshrc .
	    ln -s ~/.dotfiles/.tmux/.tmux.conf . 
	    ln -s ~/.dotfiles/i3/ ./.config/
	    ln -s ~/.dotfiles/tmuxinator/ .tmuxinator
	    ln -s ~/.dotfiles/tmuxinator/ .tmuxinator
	    ln -s ~/.dotfiles/.xbindkeysrc .
        ln -s ~/.dotfiles/ranger/bookmarks . -f

	    mkdir ~/.dotfiles/.vim/backup
	    mkdir ~/.dotfiles/.vim/swap
	    mkdir ~/.dotfiles/.vim/undo

	    ln -s ~/.dotfiles/.vim/.vimrc .
	    # Gets vim plug working
	    ln -s ~/.dotfiles/.vim .
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        
        cd ~/.calcurse
        ln -s ~/.dotfiles/.calcurse/keys ~/.dotfiles/.calcurse/conf .

        cd ~
        # inputrc so gdb can work wonders, ctrl P/N to reverse history search
        ln -s ~/.dotfiles/.inputrc .

        # for bashmarks
        ln -s ~/.dotfiles/zsh/scripts/.sdirs .

        cd ~/.dotfiles

        # if hash rg 2>/dev/null; then
        #     cd ~/test_files
            
        #     cd ~
        # fi
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
