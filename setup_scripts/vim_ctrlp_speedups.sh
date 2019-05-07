#!/usr/bin/env sh
# https://bluz71.github.io/2017/10/26/turbocharge-the-ctrlp-vim-plugin.html

INSTALLATION_DIR=~/.dotfiles/setup_scripts/installation_files
PROGRAM_DIR=~/.local/bin/

# SCRIPT DEPENDENCIES
FETCH_SCRIPT=~/.dotfiles/setup_scripts/fetch_script.sh

if [ -d $INSTALLATION_DIR ]; then
    cd $INSTALLATION_DIR
else
    mkdir $INSTALLATION_DIR && cd $INSTALLATION_DIR
fi

installCTRLPSpeedups() {
    sudo apt install cmake python-dev libboost-all-dev

    # run above apt install then add this to vimrc using Plug
    # Plug 'nixprime/cpsm', { 'do': 'env PY3=OFF ./install.sh' }
    # let g:ctrlp_match_func = { 'match': 'cpsm#CtrlPMatch' }

    $FETCH_SCRIPT "sharkdp/fd" "deb"

    sudo dpkg -i $INSTALLATION_DIR/*amd64*
}

installAll() {
    installCTRLPSpeedups

    echo "Installation Complete!"
}

installAll
