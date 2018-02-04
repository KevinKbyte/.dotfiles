#!/usr/bin/env bash

HOME=/home/kevin
CONF=$HOME/.dotfiles
ln -s $CONF/.tmux ~/.tmux
ln -s $CONF/tmuxinator ~/.tmuxinator
ln -s $CONF/.tmux/.tmux.conf ~/.tmux.conf
ln -s $CONF/.vim ~/.vim
ln -s $CONF/.vim/.vimrc ~/.vimrc
ln -s $CONF/.xbindkeysrc ~/.xbindkeysrc
ln -s $CONF/zsh/.zshrc ~/.zshrc
# ln -s $CONF/
# ln -s $CONF/
