#!/bin/bash

# Primary monitor
primary=eDP-1
# Secondary monitor
secondary=HDMI-1-0

if  xrandr | grep -q "$secondary d"; then
	xrandr --output "$secondary" --off
else
	xrandr --output "$secondary" --auto
	xrandr --output "$secondary" --right-of "$primary"
fi

