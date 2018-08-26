#!/bin/bash

echo "Press [Ctrl+C] to stop..."
start=`date +%s`

while true
do
    sysbench --test=cpu --cpu-max-prime=2000 --num-threads=4 run &> /dev/null

    temp=`vcgencmd measure_temp`
    current=`date +%s`
    runtime=$((current-start))
    echo "[${runtime}s] $temp"
done


