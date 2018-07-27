#!/usr/bin/env bash

active=true

if [[ $active = true ]]; then
    i3-msg mode "mode_small_mouse_move" && xdotool keydown super keyup super
fi
