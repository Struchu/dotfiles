#!/bin/sh

if [ "$1" = 'swap' ]; then
    OP="node -d"
else
    OP="desktop -f"
fi

if [ "$MONITOR_COUNT" = 2 ]; then
    if [ "$2" = "1" ]; then bspc $OP '^1'; fi
    if [ "$2" = "2" ]; then bspc $OP '^6'; fi
    if [ "$2" = "3" ]; then bspc $OP '^2'; fi
    if [ "$2" = "4" ]; then bspc $OP '^7'; fi
    if [ "$2" = "5" ]; then bspc $OP '^3'; fi
    if [ "$2" = "6" ]; then bspc $OP '^8'; fi
    if [ "$2" = "7" ]; then bspc $OP '^4'; fi
    if [ "$2" = "8" ]; then bspc $OP '^9'; fi
    if [ "$2" = "9" ]; then bspc $OP '^5'; fi
    if [ "$2" = "10" ]; then bspc $OP '^10'; fi
else
    bspc $OP "^$2"
fi
