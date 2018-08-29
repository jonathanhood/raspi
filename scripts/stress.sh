#!/bin/bash

cores=`cat /proc/cpuinfo  | grep processor | wc -l`

function compute_primes_forever {
	while true
	do
		sysbench --test=cpu --cpu-max-prime=20000 --num-threads=$cores run &> /dev/null
	done
}

function measure_system_forever {
    while true
    do
        core=`vcgencmd measure_clock arm`
        temp=`vcgencmd measure_temp`
        volts=`vcgencmd measure_volts`
        current=`date +%s`
        runtime=$((current-start))
        echo "[${runtime}s] $temp $core $volts"
        sleep 5
    done
}


echo "Stressing $cores cores"
echo "Press [Ctrl+C] to stop..."
start=`date +%s`

(compute_primes_forever)&
measure_system_forever

