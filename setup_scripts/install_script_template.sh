#!/usr/bin/env sh

INSTALLATION_DIR=~/.dotfiles/setup_scripts/installation_files
PROGRAM_DIR=~/.local/bin/

# SCRIPT DEPENDENCIES
FETCH_SCRIPT=~/.dotfiles/setup_scripts/fetch_script.sh

if [ -d $INSTALLATION_DIR ]; then
    cd $INSTALLATION_DIR
else
    mkdir $INSTALLATION_DIR && cd $INSTALLATION_DIR
fi

install() {

}

installAll() {
    install

    echo "Installation Complete!"
}

installAll
