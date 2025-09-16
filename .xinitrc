#!/bin/sh
export TERMINAL="alacritty"
export EDITOR="vim"


xrandr --output Virtual-1 --mode 1920x1080
feh --bg-scale Pictures/zrljsjt.jpeg
picom -b &
dwmblocks &
exec dwm
