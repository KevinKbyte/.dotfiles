#!/usr/bin/python3
import i3ipc
from sys import argv

# Create the Connection object that can be used to send commands and subscribe
# to events.
i3 = i3ipc.Connection()
mark = argv[1]

def focus(i3, mark):
    tree = i3.get_tree()

    try:
    # If no marks found (e.g. if in an empty workspace), continue
        focused = tree.find_focused()

        # If the mark is the same as focused container's, then move to scratchpad
        if focused.marks[0] == mark:
            i3.command('[con_mark="^' + mark + '$"] move scratchpad')
            i3.command('[con_mark="^' + mark + '$"] floating toggle')
        else:
            i3.command('[con_mark="^' + mark + '$"] focus')
    except Exception:
        pass

    # Since not currently focused, focus on mark
    i3.command('[con_mark="^' + mark + '$"] focus')

    if tree.find_marked(mark)[0].workspace().name == '__i3_scratch':
        # If mark was in scratchpad, unfloat it
        i3.command('[con_mark="^' + mark + '$"] floating toggle')
        i3.command('[con_mark="^' + mark + '$"] floating toggle')

focus(i3, mark)
exit(0)
