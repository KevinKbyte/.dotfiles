#!/usr/bin/python3
# https://www.reddit.com/r/i3wm/comments/4hasjg/412_is_for_windowcon_id_focused_border_pixel_5/
# Swaps the terminal with chromium and chromium with terminal, depending on what is being currently focused on
import i3ipc
from sys import argv

# Create the Connection object that can be used to send commands and subscribe
# to events.
i3 = i3ipc.Connection()

possible_containers = ['Gnome-terminal', 'Chromium-browser']
jump_first = possible_containers[int(argv[1])]

# Dynamically change border for active window
def on_window_focus(i3):
    try:
        focused = i3.get_tree().find_focused()
        if focused.marks[0] == possible_containers[0]:
            print("yo")
            i3.command('[con_mark="' + possible_containers[1] + '"] focus')
        elif focused.marks[0] == possible_containers[1]:
            print("wo")
            i3.command('[con_mark="' + possible_containers[0] + '"] focus')
        else:
            i3.command('[con_mark="' + jump_first + '"] focus')
        return
    except IndexError:
        pass
    i3.command('[con_mark="' + jump_first + '"] focus')
    exit(0)

# Subscribe to events
# i3.on("window::focus", on_window_focus)

# Start the main loop and wait for events to come in.
# i3.main()

on_window_focus(i3)
