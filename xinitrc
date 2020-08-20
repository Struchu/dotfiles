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

if xinput list | grep "$TOUCH_PAD"; then
    xinput set-prop "$TOUCH_PAD" "libinput Tapping Drag Enabled" 0
fi

detect_monitors

xrandr --dpi 120

TOUCHSCREEN="ELAN Touchscreen"
if xinput list | grep "$TOUCHSCREEN"; then
    xinput --map-to-output "$TOUCHSCREEN" "eDP1"
fi

which xbacklight && doas xbacklight -set 20

# Set background color
xsetroot -solid "#eee8d5"

# Autostart
killall -9 xbanish; xbanish &
killall -9 check_mail; check_mail &
killall -9 sync_tasks; sync_tasks &
killall -9 dwmblocks; dwmblocks &
killall -9 temp; temp &

# Adjust colors

redshift -x && redshift -O 5700

# Start GPG agent
GPG_AGENT_SOCK=$(gpgconf --list-dirs agent-socket)
if [ ! -S $GPG_AGENT_SOCK ]; then
  gpg-agent --daemon >/dev/null 2>&1
fi

export GPG_TTY=$(tty)
echo UPDATESTARTUPTTY | gpg-connect-agent >/dev/null 2>&1

exec dwm
