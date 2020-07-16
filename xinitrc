#!/bin/bash

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrdb -load ~/.Xresources

# Setup the keyboard
setxkbmap pl
setxkbmap -option caps:escape
xset r off

export PATH="$HOME/dotfiles/bin:$PATH"

# Disable touchpad on ThinkPadX240
TOUCH_PAD="Synaptics TM2927-001"
TOUCHSCREEN="ELAN Touchscreen"

if xinput list | grep "$TOUCH_PAD"; then
    xinput set-prop "$TOUCH_PAD" "libinput Tapping Drag Enabled" 0
fi

export MONITOR_COUNT=$(xrandr | grep ' connected' | wc -l)

# Set the screens
if xrandr | grep eDP1 >/dev/null; then
    if [ "$MONITOR_COUNT" = 2 ]; then
        xrandr --output DP1 --left-of eDP1
    fi

    xbacklight -set 10
    xrandr --dpi 120
    xinput --map-to-output "$TOUCHSCREEN" "eDP1"
else
    xrandr --output DP1 --left-of HDMI1
fi

# Set background color
xsetroot -solid "#eee8d5"

# Autostart
killall -9 xbanish; xbanish &
killall -9 check_mail; check_mail &
killall -9 sync_tasks; sync_tasks &
killall -9 dwmblocks; dwmblocks &
killall -9 temp; temp &

# Start GPG agent
GPG_AGENT_SOCK=$(gpgconf --list-dirs agent-socket)
if [ ! -S $GPG_AGENT_SOCK ]; then
  gpg-agent --daemon >/dev/null 2>&1
fi

export GPG_TTY=$(tty)
echo UPDATESTARTUPTTY | gpg-connect-agent >/dev/null 2>&1

exec dwm
