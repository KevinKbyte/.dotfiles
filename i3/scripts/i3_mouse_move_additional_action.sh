#!/usr/bin/env bash

# Activate small mouse move after large mouse movement

i3-msg mode "mode_small_mouse_move" && xdotool keydown super keyup super

if [[ ! -z "$1" ]]; then
    xdotool click 1
    i3-msg mode "default"
    ~/Desktop/projects/jumping-mouse/build/gromit-mpx -v
fi
# pqiv -c -c -i '/home/kev/test_files/test_scripts/overlay/test.gif'
