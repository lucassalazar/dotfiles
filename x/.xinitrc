#!/usr/bin/env bash

# Load Xresources
xrdb -merge ~/.Xresources &

# Compositor
# picom -f --config ~/.config/picom/picom.conf --vsync &

# Notifications
# dunst &

# Sets the keyboard layout to english
# setxkbmap us &

# Network Manager
# nm-applet &

# Battery Utility
# cbatticon &

# Removable Media Utility
# udiskie -t -f pcmanfm &

# Bluetooth Manager
# blueberry-tray &

# Volume Utility
# volumeicon &

# Screenshot Utility
# flameshot &

# exec i3
# exec qtile start
# exec awesome
# exec dwm
# while type dwm >/dev/null ; do dwm && continue || break ; done
