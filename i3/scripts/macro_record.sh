#!/usr/bin/env bash
# https://superuser.com/questions/46376/a-good-keyboard-macro-program-for-ubuntu

# -k 62 is keycode 62, right shift
timeout 120 bash -c 'notify-send "Recording macro; press ESC to stop" ; xmacrorec2 -k 62 > /tmp/macro ; notify-send "Recording macro finished"'
