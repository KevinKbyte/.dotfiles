#!/bin/sh -e

# Turn the screen off after a delay
# -f to show failed attempts
# -i for image
# -p to display hardcoded Windows-Pointer
# -u to no unlock indicator

set -e
xset s off dpms 0 10 0
# i3lock --color=4c7899 --ignore-empty-password --show-failed-attempts --nofork

amixer -D pulse sset Master mute

i3lock --pointer=win -u --ignore-empty-password -f --color=000000 --nofork

pkill -RTMIN+10 i3blocks

xset s off -dpms
