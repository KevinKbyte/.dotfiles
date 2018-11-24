#!/usr/bin/env python3

import i3ipc
from sys import argv

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

    if argv[1] == "next":
        i_x = (leaves.index(focused) + 1) % len(leaves)
    else:
        i_x = (leaves.index(focused) - 1) % len(leaves)

    leaves[i_x].command('focus')

alt_tab(i3)
exit(0)
