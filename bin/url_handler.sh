#!/bin/bash

case $1 in
    http*://*youtube.com/watch?*|http*://youtu.be/*)
        nohup mpv "ytdl://$1" >/dev/null 2>&1 &
    ;;
    # Slack files are usually not public
    http*://*slack.com/*)
        nohup qutebrowser "$1" >/dev/null 2>&1 &
    ;;
    spotify:*)
        mpc add "$1"
    ;;
    *.gif*|*.gifv*|*.webm*)
        nohup mpv --loop-file "$1" >/dev/null 2>&1 &
    ;;
    *.mp4*)
        nohup mpv "$1" >/dev/null 2>&1 &
    ;;
    *.jpg*|*.jpeg*|*.png*)
        nohup feh "$1" >/dev/null 2>&1 &
    ;;
    *.pdf*)
        wget "$1" -O - | nohup zathura - >/dev/null 2>&1 &
    ;;
    *)
        nohup qutebrowser "$1" >/dev/null 2>&1 &
    ;;
esac
