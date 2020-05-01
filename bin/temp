#!/bin/bash

while :
do
    current_temp=`temper-poll | tail -n 1 | awk -F' ' '{ print $3 }'`
    echo "$current_temp" > /tmp/temper.deg

    sleep 60
done
