#!/bin/bash

# for (( i = 0; i < 6; i++ )); do
#     BATTINFO=$(acpi --b)

#     if [[ `echo $BATTINFO | grep Discharging` ]]; then
#         # https://faq.i3wm.org/question/1730/warning-popup-when-battery-very-low.1.html
#         if [[ `echo $BATTINFO | cut -f 5 -d " "` < 00:12:00 ]]; then
#             sleep 30
#             systemctl suspend
#         fi
#         if [[ `echo $BATTINFO | cut -f 5 -d " "` < 00:15:00 ]]; then
#                 DISPLAY=:0.0 notify-send "Feed me...""I'm hungry!"
#                 DISPLAY=:0.0 zenity --info --title "I hunger for AC power" --text "Feed me...\nI'm hungry!"

#                 i3-nagbar -m 'Battery low!' -b 'Hibernate!' 'systemctl suspend' >/dev/null 2>&1 &
#                 # sleep 120
#                 # if [[ $BATTSTATUS == "discharging" ]]; then
#                 #    systemctl suspend
#                 # fi
#                 # DISPLAY=:0.0 zenity --question --title "I hunger for AC power" --text "Will you feed me...?" ; if [[ $? == 1 ]] ; then
#                 # zenity --info --title "Get off your high horse" --text "You're mean." --display=:0.0 
#             fi
#     else
#         # don't worry about checking for charge if already charging
#         # crontab set to load script again in an hour
#         # # m h  dom mon dow   command
#         # */60 * * * * /home/kev/.dotfiles/i3/scripts/low_battery_alert.sh
#         exit 0
#     fi
#     sleep 600
# done

BATTINFO=$(acpi --b)

if [[ `echo $BATTINFO | grep Discharging` ]]; then
    # https://faq.i3wm.org/question/1730/warning-popup-when-battery-very-low.1.html
    if [[ `echo $BATTINFO | cut -f 5 -d " "` < 00:12:00 ]]; then
        sleep 5
        systemctl suspend
    fi
    if [[ `echo $BATTINFO | cut -f 5 -d " "` < 00:15:00 ]]; then
            DISPLAY=:0.0 notify-send "Feed me...""I'm hungry!"
            DISPLAY=:0.0 zenity --info --title "I hunger for AC power" --text "Feed me...\nI'm hungry!"
    fi
fi
