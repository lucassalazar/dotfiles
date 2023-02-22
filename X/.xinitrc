#!/bin/sh

xrdb -merge ~/.Xresources &
nm-applet &
picom -b &
dunst &
udiskie -t -f pcmanfm & 
blueberry-tray &
sleep 5 && volumeicon &
flameshot &

exec i3
# exec awesome
