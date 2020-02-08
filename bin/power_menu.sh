#!/bin/sh

option=$(dmenu -fn 'Inconsolata:size=13' -nb '#fdf6e3' -nf '#657b83' -sb '#eee8d5' -sf '#657b83' << END)
Logout
Reboot
Power Off
END

case "$option" in
    Logout)
        bspc quit
        ;;
    Reboot)
        sudo reboot
        ;;
    "Power Off")
        sudo halt
        ;;
esac
 