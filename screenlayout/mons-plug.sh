#!/bin/env bash

eDP=eDP
HDMI=$(xrandr -q | grep 'HDMI-A-0 connected' | awk '{print $1}')
DP=$(xrandr -q | grep 'DisplayPort-[0-9] connected' | awk '{print $1}')

function disconnect_dp() {
    active_monitors=("$(xrandr --listactivemonitors | grep 'DisplayPort-[0-9]' | awk '{print $4}')")
    connect_monitors=("$(xrandr -q | grep 'DisplayPort-[0-9] connected' | awk '{print $1}')")

    for i in "${active_monitors[@]}"; do
        [[ $i != "${connect_monitors[0]}" ]] && echo "Disconnecting $i" && xrandr --output "$i" --off
    done
}

case ${MONS_NUMBER} in
3)
    xrandr --output "$eDP" --off --output "$HDMI" --primary --mode 2560x1440 --pos 0x0 --rotate normal --output "$DP" --mode 2560x1440 --pos 2560x0 --rotate normal

    disconnect_dp
    ;;
2)

    xrandr --output "$eDP" --mode 1920x1080 --pos 0x0 --output "$HDMI" --primary --mode 2560x1440 --pos 1920x0 --rotate normal

    ;;
1)
    xrandr --auto

    ;;

esac

pgrep -x sxhkd >/dev/null || sxhkd &
~/.fehbg &
bspc wm -r
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
exit 0
