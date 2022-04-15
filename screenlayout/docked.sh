#!/bin/sh

monitor_count="$(xrandr -q | rg " connected" | wc -l)"
all_monitors=($(xrandr -q | rg " connected" | awk '{print $1}'))

echo "$monitor_count"
echo "$all_monitors"

case $monitor_count in
3)
    xrandr --output "${all_monitors[0]}" --off --output "${all_monitors[1]}" --primary --mode 2560x1440 --rate 143.86 --pos 0x0 --rotate normal --output "${all_monitors[2]}" --mode 2560x1440 --pos 2560x0 --rotate normal --rate 119.88

    ;;
2)

    xrandr --output "${all_monitors[0]}" --mode 1920x1080 --pos 0x0 --output "${all_monitors[1]}" --primary --mode 2560x1440 --pos 1920x0 --rotate normal

    ;;
1)
    xrandr --output "${all_monitors[0]}" --mode 1920x1080 --rate 60.01 --pos 0x0 --rotate normal

    ;;
esac
    pgrep -x sxhkd > /dev/null || sxhkd &
    picom --experimental-backends -b  &
    bspc wm -r
    xmodmap ~/.Xmodmap
