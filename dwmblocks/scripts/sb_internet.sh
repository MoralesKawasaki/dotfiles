#!/bin/sh

# Show wifi 📶 and percent strength or 📡 if none.
# Show 🌐 if connected to ethernet or ❎ if none.
# Show 🔒 if a vpn connection is active

case $BLOCK_BUTTON in
	1) "$TERMINAL" -e nmtui; pkill -RTMIN+4 dwmblocks ;;
	3) notify-send "🌐 Internet module" "\- Click to connect
❌: wifi disabled
📡: no wifi connection
📶: wifi connection with quality
❎: no ethernet
🌐: ethernet working
🔒: vpn is active
" ;;
	6) setsid -f "alacritty" -e "vim" "$0" ;;
esac

ETHER_ICON_CONNECTED="󰱓 "
WIFI_ICON_STRONG="󰤨 "
WIFI_ICON_MEDIUM="󰤢 "
WIFI_ICON_WEAK="󰤟 "
ICON_DISCONNECTED="󰲛 "

if [ "$(cat /sys/class/net/e*/operstate 2>/dev/null)" = 'up' ] ; then
	echo "$ETHER_ICON_CONNECTED"$(ip -4 addr show enp0s3 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
	exit 0
fi

# Wifi
if [ "$(cat /sys/class/net/w*/operstate 2>/dev/null)" = 'up' ] ; then
	wifiicon="$(awk '/^\s*w/ { print "󰖩 ", int($3 * 100 / 70) "% " }' /proc/net/wireless)"
elif [ "$(cat /sys/class/net/w*/operstate 2>/dev/null)" = 'down' ] ; then
	[ "$(cat /sys/class/net/w*/flags 2>/dev/null)" = '0x1003' ] && wifiicon="󰖩 " || wifiicon="󱚼 "
fi

echo "$ICON_DISCONNECTED Disconnected"