#!/bin/bash
BATTINFO=$(cat /sys/class/power_supply/BAT0/energy_now)
# while true
    # do
        if [[ $BATTINFO -lt 8004000 ]]; then
                DISPLAY=:0.0 notify-send "Feed me...""I'm hungry!"
                DISPLAY=:0.0 zenity --info --title "I hunger for AC power" --text "Feed me...\nI'm hungry!"
                DISPLAY=:0.0 zenity --question --title "I hunger for AC power" --text "Will you feed me...?" ; if [[ $? == 1 ]] ; then
                zenity --info --title "Get off your high horse" --text "You're mean." --display=:0.0 
            fi
        fi
        # sleep 300 # sleep 5 minutes
# done
