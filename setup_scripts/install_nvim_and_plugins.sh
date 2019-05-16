#!/usr/bin/env sh

INSTALLATION_DIR=~/.dotfiles/setup_scripts/installation_files
PROGRAM_DIR=~/.local/bin/

RUN_SUDO_CMDS="true"

# SCRIPT DEPENDENCIES
FETCH_SCRIPT=~/.dotfiles/setup_scripts/fetch_script.sh

if [ -d $INSTALLATION_DIR ]; then
    cd $INSTALLATION_DIR
else
    mkdir $INSTALLATION_DIR && cd $INSTALLATION_DIR
fi


installNeovim() {
    $FETCH_SCRIPT "neovim/neovim" "appimage"

    # If doesn't have FUSE - filesystem in user space
    # ./nvim.appimage --appimage-extract
    # ./squashfs-root/usr/bin/nvim
    # Otherwise:
    chmod u+x nvim.appimage 
    cd $PROGRAM_DIR
    ln -s $INSTALLATION_DIR/nvim.appimage ./nvim
}

sudoCommands() {
    if [ $RUN_SUDO_CMDS == "true" ]; then
        # for Node.js
        sudo npm install -g neovim
    fi
}

installNeovimPlugins() {
    # Denite - unite interfaces, kinda like Emacs Helm
    pip3 install --user pynvim
}

installAll() {
    installNeovim
    installNeovimPlugins

    sudoCommands

    echo "Installation Complete!"
}

installAll
