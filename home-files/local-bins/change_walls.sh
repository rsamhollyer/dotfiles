#!/bin/sh
walls_dir=$HOME/.config/wpg/wallpapers
declare -a walls_arr=("Add New ")

for file in $(ls $walls_dir)
    do
        walls_arr+=("$file")
    done

choice=$(printf '%s\n' "${walls_arr[@]}" | rofi -dmenu -i -theme $HOME/.config/rofi/wallpaper.rasi)

 [[ $choice == "Add New " ]] && exec wpg 



if [[ -z ${choice} ]];then
# If no choice is made, then exit
    exit 1
else
# Else, set that wallpaper theme
    wpg -s "$choice" &
    picom --experimental-backends -b &
    bspc wm -r
fi
