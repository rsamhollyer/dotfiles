#!/bin/env bash

alac_dir="$HOME/.config/alacritty"
colors_dir="$alac_dir/colors"

for file in "$colors_dir"/*; do
    color="$(basename "$file" .yml)"
    colors_arr+=("$color")
done

choice=$(printf '%s\n' "${colors_arr[@]}" | rofi -dmenu -i -theme "$HOME"/.config/rofi/launchers/type-1/style-1.rasi)

if [[ -z ${choice} ]]; then
    # If no choice is made, then exit
    exit 1
else
    # Else, set that color theme
    sed -i "s/-.*.yml/- ~\/.config\/alacritty\/colors\/$choice.yml/" "$alac_dir"/alacritty.yml
fi
