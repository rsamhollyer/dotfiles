#!/bin/env bash
sleep 1

eDP=eDP
HDMI=$(xrandr -q | grep 'HDMI-A-0 connected' | awk '{print $1}')
DP=$(xrandr -q | grep 'DisplayPort-[0-9] connected' | awk '{print $1}')

if [[ -n $DP ]]; then
  xrandr --output "$eDP" --off --output "$HDMI" --primary --mode 2560x1440 --rate 143.86 --pos 0x0 --rotate normal --output "$DP" --mode 2560x1440 --pos 2560x0 --rotate normal --rate 119.88

elif [[ -n $HDMI ]]; then
  xrandr --output "$eDP" --mode 1920x1080 --pos 0x0 --output "$HDMI" --primary --mode 2560x1440 --pos 1920x0 --rotate normal

else
  xrandr --auto
fi

pgrep -x sxhkd >/dev/null || sxhkd &
~/.fehbg &
bspc wm -r
exit 0
