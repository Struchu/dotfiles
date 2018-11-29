#!/bin/bash

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrdb -load ~/.Xresources

setxkbmap pl
setxkbmap -option caps:escape
xset r off

export PATH=$HOME/dotfiles/bin/:$PATH

TOUCH_PAD="Synaptics TM2927-001"

if xinput list | grep "$TOUCH_PAD"; then
    xinput set-prop "$TOUCH_PAD" "Synaptics Off" 1
fi

if xrandr | grep eDP1 >/dev/null; then
    xbacklight --set 30
    xrandr --dpi 120
else
    xrandr --output DP1 --left-of HDMI1
fi

xbanish &
check_mail &
sync_tasks &
temp.sh &

xsetroot -solid "#eee8d5"

exec bspwm
