#!/bin/sh
THIRD_MONITOR=$( xrandr -q | rg " connected" | rg ^DisplayPort | awk '{print $1}' )
xrandr --output eDP --off --output HDMI-A-0 --primary --mode 2560x1440 --rate 143.86 --pos 0x0 --rotate normal --output "$THIRD_MONITOR" --mode 2560x1440 --pos 2560x0 --rotate normal --rate 119.88 -v

pgrep -x sxhkd > /dev/null || sxhkd &
picom --experimental-backends -b  &
bspc wm -r
