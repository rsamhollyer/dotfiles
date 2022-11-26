#!/bin/env bash

eDP=eDP
HDMI=$(xrandr -q | grep 'HDMI-A-0 connected' | awk '{print $1}')
DP=$(xrandr -q | grep 'DisplayPort-[0-9] connected' | awk '{print $1}')

function disconnect_dp() {
  xrandr --output DisplayPort-0 --off
  xrandr --output DisplayPort-1 --off
  xrandr --output DisplayPort-2 --off
  xrandr --output DisplayPort-3 --off
  xrandr --output DisplayPort-4 --off

}

disconnect_dp

case ${MONS_NUMBER} in
3)
  xrandr --output "$eDP" --off --output "$HDMI" --primary --mode 2560x1440 --pos 0x0 --rotate normal --output "$DP" --mode 2560x1440 --pos 2560x0 --rotate normal

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
# [[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
exit 0
