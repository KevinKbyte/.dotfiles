#!/bin/bash
# if synclient -l | grep "TouchpadOff .*=.*0" ; then
#     synclient TouchpadOff=1 ;
# else
#     synclient TouchpadOff=0 ;
# fi
if [[ $(xinput --list-props 14 | grep 144 | awk '{print $NF}') == '0' ]]; then
   xinput set-prop 14 144 1 
else
   xinput set-prop 14 144 0
fi
