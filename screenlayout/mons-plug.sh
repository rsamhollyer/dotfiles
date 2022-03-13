#!/bin/sh

case ${MONS_NUMBER} in
    3)
    extra="$(xrandr -q | rg " connected" | rg ^DisplayPort | awk '{print $1}')"
    xrandr --output eDP --off --output HDMI-A-0 --primary --mode 2560x1440 --rate 143.86 --pos 0x0 --rotate normal --output "$extra" --mode 2560x1440 --pos 2560x0 --rotate normal --rate 119.88

    pgrep -x sxhkd > /dev/null || sxhkd &
    picom --experimental-backends -b  &
    bspc wm -r
    xmodmap ~/.Xmodmap
    sh ~/.config/wpg/wp_init.sh

    ;;
    2)
    extra="$(xrandr -q | rg " connected" | rg ^DisplayPort | awk '{print $1}')"
    xrandr --output eDP --mode 1920x1080 --rate 60.01 --pos 0x0 --rotate normal --output "${extra:-HDMI-A-0}" --primary --mode 2560x1440 --rate 143.86 --pos 1920x0 --rotate normal

    pgrep -x sxhkd > /dev/null || sxhkd &
    picom --experimental-backends -b  &
    bspc wm -r
    xmodmap ~/.Xmodmap
    sh ~/.config/wpg/wp_init.sh

    ;;
    1)
    xrandr --output eDP --mode 1920x1080 --rate 60.01 --pos 0x0 --rotate normal

    pgrep -x sxhkd > /dev/null || sxhkd &
    picom --experimental-backends -b  &
    bspc wm -r
    xmodmap ~/.Xmodmap
    sh ~/.config/wpg/wp_init.sh

    ;;
esac


