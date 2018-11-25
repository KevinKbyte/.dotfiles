#!/usr/bin/env bash

# https://unix.stackexchange.com/questions/13968/show-top-five-cpu-consuming-processes-with-ps

# Top shows current CPU usage
# Ps shows avg over time
# https://unix.stackexchange.com/questions/58539/top-and-ps-not-showing-the-same-cpu-result
ps_most_cpu_intensive_process=$(ps aux | sort -nrk 3,3 | head -n 1)
top_most_cpu_intensive_process=$(top -b -n 1 | grep -v grep | sort -nk9,9 | tail -2 | head -1)
ps_cpu_usage=$(echo $ps_most_cpu_intensive_process | awk '{print $3}')
top_cpu_usage=$(echo $top_most_cpu_intensive_process | awk '{print $9}')

ps_benchmark=75
top_benchmark=300
TMP_LOG=/tmp/killed_hog.log

if [[ $ps_cpu_usage > $ps_benchmark ]]; then
    kill $(echo $ps_most_cpu_intensive_process | awk '{print $2}')
    echo ps $ps_most_cpu_intensive_process > $TMP_LOG
elif [[ $top_cpu_usage > $top_benchmark ]]; then
    kill $($top_most_cpu_intensive_process | awk '{print $1}')
    echo top $top_most_cpu_intensive_process > $TMP_LOG
fi
