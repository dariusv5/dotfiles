#!/usr/bin/env bash
read -r X Y W H < <(slop -f "%x %y %w %h" -b 1 -t 0 -q)
g=${W}x${H}+${X}+${Y}
if [ "$1" == "-p" ]; then
	bspc rule -a Termite -o state=pseudo_tiled
else
	bspc rule -a Termite -o state=floating
fi
termite --geometry $g
