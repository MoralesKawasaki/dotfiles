#!/bin/sh

ICON="󰍛 "
echo "$ICON"$(free -m | awk 'NR==2{printf "%i%%\n", ($3/$2)*100}')