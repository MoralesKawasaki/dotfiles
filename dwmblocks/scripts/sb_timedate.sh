#!/bin/sh

# format state to alternate between date format
FORMAT_FILE="/tmp/dwmblocks_date_format"
[ ! -f "$FORMAT_FILE" ] && echo "0" > "$FORMAT_FILE"
read FORMAT < "$FORMAT_FILE"

[ "$FORMAT" -eq 0 ] && echo "$(date '+󰥔 %I:%M %p')" || echo "$(date '+󰃭 %A %B %d %Y | 󰥔 %I:%M %p')"

case $BLOCK_BUTTON in
		3) echo "$(( ($FORMAT + 1) % 2 ))" > "$FORMAT_FILE"; kill -47 "$(pidof "${STATUSBAR:-dwmblocks}")" ;;
        6) setsid -f "$TERMINAL" -e "$EDITOR" "$0" ;;
esac