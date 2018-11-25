#!/usr/bin/env python3

import i3ipc
from sys import argv
from time import sleep

i3 = i3ipc.Connection()

def alt_tab(i3):
    tree = i3.get_tree()
    root = tree.root()
    leaves = root.leaves()

    for container in root.scratchpad():
        # For some reason there is a None container if containers in scratchpad, so ignore it
        if container.name:
            leaves.remove(container)

    focused = tree.find_focused()

    # if no class, then not focused on a container
    # Then focus on the first node in the workspace
    if not focused.window_class:
        if argv[1] == 'next':
            i3.command('workspace next')
            current_workspace = i3.get_tree().find_focused().workspace()

            first_container = current_workspace.descendents()[0]
            first_container.command('focus')
        else:
            i3.command('workspace prev')
            current_workspace = i3.get_tree().find_focused().workspace()

            last_container = current_workspace.descendents()[-1]
            print(first_container.name)
            last_container.command('focus')

        return

    if argv[1] == 'next':
        i_x = (leaves.index(focused) + 1) % len(leaves)
    else:
        i_x = (leaves.index(focused) - 1) % len(leaves)

    leaves[i_x].command('focus')

alt_tab(i3)
exit(0)
