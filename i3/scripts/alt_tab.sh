#!/usr/bin/env python3

import time
import i3ipc
from sys import argv
from time import sleep
import itertools

i3 = i3ipc.Connection()

# start_time = time.time()

def alt_tab(i3):
    # # https://stackoverflow.com/questions/716477/join-list-of-lists-in-python
    # leaves = list(itertools.chain.from_iterable([[ descendent for descendent in workspace.descendents() if descendent.name ] for workspace in tree.workspaces()]))

    # # For some reason there is a None container if containers in scratchpad, so ignore it
    # [leaves.remove(container) for container in root.scratchpad() if container.name in leaves]

    current_workspace = i3.get_tree().find_focused().workspace()
    focused = current_workspace.find_focused()
    leaves = current_workspace.leaves()

    # if no class, then not focused on a container
    # Then focus on the first node in the workspace
    try:
        if argv[1] == 'next':
            i_x = leaves.index(focused) + 1
        else:
            i_x = leaves.index(focused) - 1
    except ValueError: # if focused == None, NoneType obj not in list leaves
        pass

    if not focused or len(leaves) == i_x or i_x < 0:
        if argv[1] == 'next':
            i3.command('workspace next')
            current_workspace = i3.get_tree().find_focused().workspace()

            first_container = current_workspace.leaves()[0]
            first_container.command('focus')
        else:
            i3.command('workspace prev')
            current_workspace = i3.get_tree().find_focused().workspace()

            last_container = current_workspace.leaves()[-1]
            last_container.command('focus')

        return

    leaves[i_x].command('focus')

alt_tab(i3)

# print("--- %s seconds ---" % (time.time() - start_time))
exit(0)
