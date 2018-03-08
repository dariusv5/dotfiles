#!/usr/bin/env bash

G=420x250+50+610
getCoord() {
	read -r X Y W H < <(slop -f "%x %y %w %h" -b 1 -t 0 -q)
	local coord=${W}x${H}+${X}+${Y}
	echo "g = $coord"
	echo $coord | xclip -sel clip
	exit 0
}
[ "$1" = "-c" ] && getCoord;

bspc rule -a Termite -o state=floating desktop='^1'
termite --geometry $G
