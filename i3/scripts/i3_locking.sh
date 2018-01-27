#!/bin/sh -e

i3lock -i /home/kevin/Pictures/i3lock_screen/mac1.png

# Turn the screen off after a delay
sleep 10; pgrep i3lock && xset dpms force off

