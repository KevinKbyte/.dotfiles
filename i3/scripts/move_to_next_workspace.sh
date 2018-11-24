#!/usr/bin/env python3

import i3ipc
from sys import argv

i3 = i3ipc.Connection()
tree = i3.get_tree()
possible_workspaces = ["1 T","2 ","3","4","5","6","7","8","9","10"]

def move_to_next_workspace(i3):
    workspaces = tree.workspaces()

    focused_workspace = tree.find_focused().workspace()

    if argv[1] == 'next':
        i_x = ( possible_workspaces.index(focused_workspace.name) + 1 ) % 10
        print(i_x)
    else:
        i_x = ( possible_workspaces.index(focused_workspace.name) - 1 ) % 10
        print(i_x)

    i3.command('move container to workspace ' + possible_workspaces[i_x])
    i3.command('workspace ' + possible_workspaces[i_x])

move_to_next_workspace(i3)
exit(0)
