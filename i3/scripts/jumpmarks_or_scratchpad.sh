#!/usr/bin/python3
import i3ipc
from sys import argv
from time import sleep

# Create the Connection object that can be used to send commands and subscribe
# to events.
i3 = i3ipc.Connection()
mark = argv[1]

def focus(i3, mark):
    tree = i3.get_tree()

    try:
        focused = tree.find_focused()

        # Case 1: Mark is the same as focused container
        if focused.marks[0] == mark:
            i3.command('[con_mark="^' + mark + '$"] move scratchpad')
            i3.command('[con_mark="^' + mark + '$"] floating toggle')
    except Exception:
        pass


    # Case 2: In Scratchpad
    if tree.find_marked("^"+mark+"$")[0].workspace().name == '__i3_scratch':
        # Since not currently focused, focus on mark
        # If mark was in scratchpad, unfloat it
        i3.command('[con_mark="^' + mark + '$"] focus')
        i3.command('[con_mark="^' + mark + '$"] floating toggle')
        i3.command('[con_mark="^' + mark + '$"] floating toggle')
    # Case 3: Not focused, not in Scratchpad
    else:
        i3.command('[con_mark="^' + mark + '$"] focus')

focus(i3, mark)
exit(0)
