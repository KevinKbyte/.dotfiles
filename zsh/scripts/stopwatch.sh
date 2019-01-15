#!/usr/bin/env bash
function calc_time(){
    min="$(echo "$time" | awk -F ':' '{print $2}')"
    sec="$(echo "$time" | awk -F ':' '{print $3}' | awk -F '\' '{print $1}')"
    total_sec="$(( ($min * 60) + $sec ))"
    echo
    echo "$total_sec";
    exit 0
}

trap 'calc_time' SIGINT
date1=`date +%s`; 
time=$date1
while true; do 
    time="$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"
    echo -ne $time; 
    sleep 0.1
done
