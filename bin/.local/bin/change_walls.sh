#!/bin/env bash
walls_dir=$HOME/Pictures/wallpapers
prepend_command="feh --no-fehbg --bg-fill"

for file in "$walls_dir"/*; do
    file="$(basename "$file")"
    walls_arr+=("$file")
done

choice=$(printf '%s\n' "${walls_arr[@]}" | rofi -dmenu -i -theme "$HOME"/.config/rofi/launchers/type-1/style-1.rasi)

if [[ -z ${choice} ]]; then
    # If no choice is made, then exit
    exit 1
else
    # Else, set that wallpaper theme
    printf "#!/bin/env bash\n%s $prepend_command $walls_dir/$choice" >~/.fehbg
    picom --experimental-backends -b &
    ~/.fehbg &
    pkill -USR1 -x sxhkd
fi

exit 0
