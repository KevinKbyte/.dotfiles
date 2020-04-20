#!/usr/bin/env python3

import i3ipc
from sys import argv

i3 = i3ipc.Connection()

workspaces = {"^Google-chrome$": "2 ", "^Gnome-terminal$": "1 T", "^chrom_p$": "3", "^qutebrowser$": "4", "^Evince$": "10"}
# workspaces = {"^Chromium-browser$": "2 ", "^Gnome-terminal$": "1 T", "^chrom_p$": "3", "^qutebrowser$": "4", "^Evince$": "10"}

def move_to_next_workspace(i3):
    tree = i3.get_tree()

    for container, workspace in workspaces.items():
        try:
            print(container, workspace, tree.find_marked(container)[0].workspace().name)
            curr_workspace = tree.find_marked(container)[0].workspace().name
            if workspace != curr_workspace and curr_workspace != '__i3_scratch':
                i3.command('[con_mark="' + container + '"] focus')
                i3.command('move container to workspace ' + workspace)
        except IndexError: # if no container is found with mark
            pass

    # Focus this at the end
    if len(argv) > 1:
        i3.command('[con_mark="' + argv[1] + '"] focus')

move_to_next_workspace(i3)
exit(0)
