#!/usr/bin/env sh
# https://bluz71.github.io/2017/10/26/turbocharge-the-ctrlp-vim-plugin.html

sudo apt install cmake python-dev libboost-all-dev

# run above apt install then add this to vimrc using Plug
# Plug 'nixprime/cpsm', { 'do': 'env PY3=OFF ./install.sh' }
# let g:ctrlp_match_func = { 'match': 'cpsm#CtrlPMatch' }

./fetch_script.sh "sharkdp/fd"

sudo dpkg -i $(find -maxdepth 1 -iname "*amd64*"|head -1)
