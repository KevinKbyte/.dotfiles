#!/usr/bin/env python3
# https://i3ipc-python.readthedocs.io/en/latest/
import i3ipc
from os import system

def fullscreen_mode_after_mousemove(self, event):
    i3.command('mode "mode_fullscreen"')
    system('xdotool keydown super keyup super')
    exit(0)

i3 = i3ipc.Connection()
i3.on('mode::default', fullscreen_mode_after_mousemove)
i3.main()
