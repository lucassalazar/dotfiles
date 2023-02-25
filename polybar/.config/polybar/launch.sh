#!/usr/bin/env bash

# External monitor
external=HDMI-0

# Terminate already running bar instances
killall polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
if [[ $(xrandr | grep -q "$external d") ]]; then
    polybar main -c $(dirname $0)/config.ini &
else
    polybar main -c $(dirname $0)/config.ini &
    polybar external -c $(dirname $0)/config.ini &
fi