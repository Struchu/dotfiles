if [[ "$(tty)" == "/dev/tty1" ]]; then
    exec startx > "$HOME/.xorg.log" 2>&1
fi
