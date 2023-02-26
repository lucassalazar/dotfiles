#!/bin/sh

# Load Xresources
xrdb -merge ~/.Xresources &

# Compositor
picom -b &

# Sets the keyboard layout to english
setxkbmap us &

# Network manager applet
nm-applet &

# Battery systray icon
cbatticon &

# Notifications
dunst &

# Removable media manager
udiskie -t -f pcmanfm & 

# Bluetooth systray icon
blueberry-tray &

# Volume systray icon
sleep 5 && volumeicon &

# Screenshots
flameshot &

exec i3
# exec awesome
