#!/usr/bin/env bash

# rather than $DISPLAY, display on ":0.0"
# delay 60 so that it can actually play correctly
bash -c 'xmacroplay -d 60 ":0.0" < /tmp/macro && notify-send "Playing back macro on \":0.0\""'
