#!/usr/bin/env bash

bash -c 'notify-send "Playing back macro on $DISPLAY" ; xmacroplay "$DISPLAY" < /tmp/macro'
