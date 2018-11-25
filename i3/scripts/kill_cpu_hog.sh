#!/usr/bin/env bash

# https://unix.stackexchange.com/questions/13968/show-top-five-cpu-consuming-processes-with-ps
most_cpu_intensive_process=$(ps aux | sort -nrk 3,3 | head -n 1)
cpu_usage=$(echo $most_cpu_intensive_process | awk '{print $3}')
benchmark=75

echo $cpu_usage
if [[ $cpu_usage > $benchmark ]]; then
    kill $(echo $most_cpu_intensive_process | awk '{print $2}')
fi
