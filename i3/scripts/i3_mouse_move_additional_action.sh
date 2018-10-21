#!/usr/bin/env bash

# Activate small mouse move after large mouse movement
# active=false
active=false

visibility=$(cat /tmp/gromit-mpx-visibility)

toggleVisibility="ctrl+F9"

if [[ $active = true ]]; then
    i3-msg mode "mode_small_mouse_move" && xdotool keydown super keyup super
fi
