#!/usr/bin/env bash

( echo " | "$( date '+%Y-%m-%d %H:%M:%S '$($HOME/.dotfiles/i3/scripts/get-day-of-week.sh) & echo "| Energy:" $(echo "scale=3;"$(cat /sys/class/power_supply/BAT0/energy_now)"/"$(cat /sys/class/power_supply/BAT0/energy_full) | bc))" |" ); read

##!/usr/bin/expect -f
## https://askubuntu.com/questions/5363/how-to-start-a-terminal-with-certain-text-already-input-on-the-command-line
## Get a Bash shell
#spawn -noecho bash

## Wait for a prompt
#expect "$ "

## Type something
#send "date \"+%H:%M:%S   %d/%m/%y\""

## Hand over control to the user
#interact

#exit

