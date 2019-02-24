#!/bin/bash

# if OPTION=0, screenshot selection
# if OPTION=1, screenshot window
OPTION=$1
SCREENSHOTS=~/Pictures/screenshots
TEMP=/tmp/screenshot.png
while 
    if [[ $1 == 0 ]] ; then
        import $TEMP
    else
        import -window root $TEMP
    fi
    user_inputted_filename=$(zenity --entry --text "Name the selection" --entry-text $(echo screenshot-`/bin/date +%Y%m%d-%H:%M:%S`))
    if [[ ${#user_inputted_filename} == 0 ]]; then
        exit 0
    fi
    ZEN=$SCREENSHOTS/$user_inputted_filename; [ "$(find $SCREENSHOTS -wholename $ZEN)" == "$ZEN" ]; do :; done
sleep 1

cp $TEMP $ZEN.png
