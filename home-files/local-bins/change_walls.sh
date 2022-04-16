#!/bin/env bash

walls_dir=$HOME/.config/wpg/wallpapers
declare -a walls_arr=("Add New  " "Random ﮼ ")

for file in $(ls $walls_dir)
    do
        walls_arr+=("$file")
    done

choice=$(printf '%s\n' "${walls_arr[@]}" | rofi -dmenu -i -theme $HOME/.config/rofi/wallpaper.rasi)

[[ $choice == "Add New  " ]] && exec wpg
[[ $choice == "Random ﮼ " ]]

if [[ $choice == "Random ﮼ " ]];then
    wpg -m
    source "$HOME/.cache/wal/colors.sh"
    bspc config focused_border_color "$color9"
    bspc config normal_border_color "$color12"
    bspc config active_border_color "$color12"
    sh ~/.local/bin/updatecolors.sh
    picom --experimental-backends -b &
    pkill -USR1 -x sxhkd
fi

if [[ -z ${choice} ]];then
# If no choice is made, then exit
    exit 0
else
# Else, set that wallpaper theme
    wpg -s "$choice"
    source "$HOME/.cache/wal/colors.sh"
    bspc config focused_border_color "$color9"
    bspc config normal_border_color "$color12"
    bspc config active_border_color "$color12"
    sh ~/.local/bin/updatecolors.sh
    picom --experimental-backends -b &
    pkill -USR1 -x sxhkd
fi

exit 0