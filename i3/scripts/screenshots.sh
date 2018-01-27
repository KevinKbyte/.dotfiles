#!/bin/bash

# if OPTION=0, screenshot selection
# if OPTION=1, screenshot window
OPTION=$1
SCREENSHOTS=~/Pictures/screenshots
TEMP=/tmp/screenshot.png

if [ $1 -eq 1 ] ; then
    import -window root $TEMP
else
    import $TEMP
fi

while ZEN=$SCREENSHOTS/$(zenity --entry --text "Name the selection" --entry-text $(echo screenshot-`/bin/date +%Y%m%d-%H:%M:%S`)); [ "$(find $SCREENSHOTS -wholename $ZEN)" == "$ZEN" ]; do :; done
sleep 1

cp $TEMP $ZEN.png
