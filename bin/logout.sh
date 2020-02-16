#!/bin/sh

# Close all running services
for SERVICE in xbanish check_mail temp.sh sync_tasks sxhkd polybar; do
    killall -q "$SERVICE"
done

bspc quit
