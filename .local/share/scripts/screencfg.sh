#!/bin/bash

# Primary monitor
primary=eDP-1-1
# Secondary monitor
secondary=HDMI-0

if  xrandr | grep -q "$secondary d"; then
	xrandr --output "$primary" --mode 1920x1080
  xrandr --output "$secondary" --off
else
	xrandr --output "$primary" --mode 1920x1080
  xrandr --output "$secondary" --auto
	xrandr --output "$secondary" --right-of "$primary" 
fi

