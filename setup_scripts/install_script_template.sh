#!/usr/bin/env sh

INSTALLATION_DIR=~/.dotfiles/setup_scripts/installation_files
PROGRAM_DIR=~/.local/bin/

RUN_SUDO_CMDS="false"

# SCRIPT DEPENDENCIES
FETCH_SCRIPT=~/.dotfiles/setup_scripts/fetch_script.sh

if [ -d $INSTALLATION_DIR ]; then
    cd $INSTALLATION_DIR
else
    mkdir $INSTALLATION_DIR && cd $INSTALLATION_DIR
fi

install() {

}

sudoCommands() {
    if [ $RUN_SUDO_CMDS = "true" ]; then

    fi
}

installAll() {
    install

    sudoCommands

    echo "Installation Complete!"
}

installAll
