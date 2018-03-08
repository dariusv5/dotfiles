#!/usr/bin/env bash
COLORS_FILE=${HOME}/.cache/wal/colors
CONFIG_FILE=${HOME}/dotfiles/termite/config

i=0
newColors[16]=
while read line; do
	newColors[$i]=$line
	sed -i "/color$i =/c\\color$i = ${newColors[i]}" $CONFIG_FILE
	let i++
done < $COLORS_FILE
