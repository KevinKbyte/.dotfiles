#!/usr/bin/env python3

import i3ipc
from sys import argv

i3 = i3ipc.Connection()

workspaces = {"^Chromium-browser$": "2 ", "^Gnome-terminal$": "1 T", "^chrom_p$": "3", "^qutebrowser$": "4", "^Evince$": "10"}

def move_to_next_workspace(i3):
    tree = i3.get_tree()

    for container, workspace in workspaces.items():
        try:
            if workspace != tree.find_marked(container)[0].workspace().name:
                i3.command('[con_mark="' + container + '"] focus')
                i3.command('move container to workspace ' + workspace)
        except IndexError: # if no container is found with mark
            pass

    # Focus this at the end
    if len(argv) > 1:
        i3.command('[con_mark="' + argv[1] + '"] focus')

move_to_next_workspace(i3)
exit(0)
