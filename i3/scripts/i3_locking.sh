#!/bin/sh -e

# Turn the screen off after a delay
# -f to show failed attempts
# -i for image
# -p to display hardcoded Windows-Pointer
# -u to no unlock indicator
i3lock --pointer=win -u -fi ~/Pictures/screenshots/black-screen.png && xset dpms force off 
