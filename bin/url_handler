#!/bin/bash

if [ -z "$1" ]; then
    exit 0
fi

case $1 in
    http*://*youtube.com/watch?*|http*://youtu.be/*)
        TS_SOCKET=/tmp/ts.video ts mpv "ytdl://$1"
    ;;
    # Slack files are usually not public
    http*://*slack.com/*)
        nohup qutebrowser "$1" >/dev/null 2>&1 &
    ;;
    spotify:*|http*://open.spotify.com/*)
        mpc add "$1"
    ;;
    *.gif*|*.gifv*|*.webm*)
        TS_SOCKET=/tmp/ts.gif ts mpv --loop-file "$1"
    ;;
    *.mp4*)
         TS_SOCKET=/tmp/ts.video ts mpv "$1"
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
