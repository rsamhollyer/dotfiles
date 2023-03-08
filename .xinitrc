#!/bin/env bash

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -load "$userresources"
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

[[ -f ~/.config/zsh/.zshenv ]] && source ~/.config/zsh/.zshenv

sxhkd &

/usr/bin/picom &

[[ -f ~/.fehbg ]] && ~/.fehbg &

/usr/bin/numlockx &
/usr/bin/polkit-dumb-agent &

pgrep -x redshift >/dev/null || redshift -P -c ~/.config/redshift.conf &
pgrep -x pipewire >/dev/null || /usr/bin/pipewire &
pgrep -x pipewire-pulse >/dev/null || /usr/bin/pipewire-pulse &
pgrep -x wireplumber >/dev/null || /usr/bin/wireplumber &

exec bspwm
