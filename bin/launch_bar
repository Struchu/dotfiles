#!/bin/sh

killall -q polybar

while pgrep -u $(id -u) -x polybar >/dev/null; do sleep 1; done

if [ $(hostname) = 'calla-bryn-sturgis' ]; then
    polybar top-left &
    polybar top-right &
    polybar spotify &
elif [ $(hostname) = 'gilead' ]; then
    if [ "$MONITOR_COUNT" = 2 ]; then
        polybar top-left-thinkpad &
    fi

    polybar thinkpad &
fi
