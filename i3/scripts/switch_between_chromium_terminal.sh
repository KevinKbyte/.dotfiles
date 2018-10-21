#!/usr/bin/python3
# https://www.reddit.com/r/i3wm/comments/4hasjg/412_is_for_windowcon_id_focused_border_pixel_5/
# Swaps the terminal with chromium and chromium with terminal, depending on what is being currently focused on
import i3ipc

# Create the Connection object that can be used to send commands and subscribe
# to events.
i3 = i3ipc.Connection()

# Dynamically change border for active window
def on_window_focus(i3):
    focused = i3.get_tree().find_focused()
    if focused.marks[0] == 'chromium':
        i3.command('[con_mark="terminal"] focus')
    elif focused.window_class == 'Gnome-terminal':
        i3.command('[con_mark="chromium"] focus')

# Subscribe to events
# i3.on("window::focus", on_window_focus)

# Start the main loop and wait for events to come in.
# i3.main()

on_window_focus(i3)
