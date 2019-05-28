#!/bin/sh

notify () {
	backlight=$(xbacklight -get | awk '{ n = sprintf( "%1.0e", $1 ); printf "%d", n }')
	notify-send "Backlight: ${backlight}"
}


case "$1" in
	inc)
		xbacklight -inc $2
		notify
		;;
	dec)
		xbacklight -dec $2
		notify
		;;
	*)
		echo "Usage: $0 inc|dec N"
		;;
esac
