#!/usr/bin/env python3

import i3ipc
from sys import argv

i3 = i3ipc.Connection()

def move_and_focus(i3):
    """
    :arg1: i3
    :returns: void

    Moves to input argv[1]
    Focuses on currently focused container
    """
    tree = i3.get_tree()
    focused = tree.find_focused()

    # Only works for containers with one mark each
    marks = [descendents.marks[0] for descendents in focused.workspace().descendents()]

    # If already there, there, moves container to original space
    if argv[1] in marks:
        i3.command('move container to workspace back_and_forth; workspace back_and_forth')
    else:
        i3.command('move container to mark ' + argv[1])
        focused.command('focus')
        i3.command('layout toggle split')

move_and_focus(i3)
exit(0)
