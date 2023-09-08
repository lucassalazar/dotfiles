#!/bin/sh

### Set Display ###
~/.local/scripts/monitorcfg &

### Set Wallpaper ###
~/.local/scripts/wallpapercfg &

### Set Autotiling ###
~/.local/scripts/autotiling &

### Launch Bar ###
~/.config/polybar/launch.sh &
