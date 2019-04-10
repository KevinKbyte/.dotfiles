#!/bin/bash
# if synclient -l | grep "TouchpadOff .*=.*0" ; then
#     synclient TouchpadOff=1 ;
# else
#     synclient TouchpadOff=0 ;
# fi

# https://stackoverflow.com/questions/16618371/using-awk-to-grab-only-numbers-from-a-string

touchpad=$( xinput --list-props 14 | grep "Device Enabled" )
touchpad_num=$( echo $touchpad | awk '{print $3}' | awk -F'[^0-9]*' '$0=$2')
if [[ $(echo "$touchpad" | awk '{print $NF}') == '0' ]]; then
   xinput set-prop 14 $touchpad_num 1 
else
   xinput set-prop 14 $touchpad_num 0
fi
