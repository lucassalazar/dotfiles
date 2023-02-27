#!/bin/sh

# Load Xresources
xrdb -merge ~/.Xresources &

# Display Resolution
xrandr --output eDP-1-1 --primary --mode 1920x1080 &

# Wallpaper
feh --bg-scale ~/pictures/wallpaper.jpg &

# Compositor
picom -f &

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

# exec dwm
exec i3
