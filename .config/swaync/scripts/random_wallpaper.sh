#!/bin/bash

WALL_DIR="/home/morales/Pictures/Wallpapers/"

RANDOM_IMAGE=$(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)
echo "$RANDOM_IMAGE"
if [ -f "$RANDOM_IMAGE" ]; then
    matugen image "$RANDOM_IMAGE"
    swww img --transition-fps 60 --transition-step 255 --transition-type center $RANDOM_IMAGE

    notify-send -a "Matugen" "Theme Applied" "Wallpaper and Theme updated successfully!"
else
    notify-send -a "Matugen" "Error!" "Wallpapers not found! Make sure to put some inside your wallpapers folder :("
fi