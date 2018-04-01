#!/usr/bin/env bash

# Source pywal colors
. "${HOME}/dotfiles/scheme/colors.sh"

pkill dunst
dunst \
	-lb "${color0}" \
	-lf "${color15}" \
	-lfr "${accent}" \
	-nb "${color0}" \
	-nf "${color15}" \
	-nfr "${accent}" \
	-cb "${color0}" \
	-cf "${color1}" \
	-cfr "${color1}" \
	-font "Gohu Gohufont 12" \
	-geometry "600x40-18+45" &

#	Low urgency settings. (background, foreground, frame)
#	-lb "${color0}" \
#	-lf "${color15}" \
#	-lfr "${color2}" \
#	Normal urgency settings. (background, foreground, frame)
#	-nb "${color0}" \
#	-nf "${color15}" \
#	-nfr "${color2}" \
#	Critical urgency settings. (background, foreground, frame)
#	-cb "${color0}" \
#	-cf "${color15}" \
#	-cfr "${color4}" \
#	Set font
#	-font "Gohu Gohufont 12" \
#	Set notification size ([{width}][x{height}][+/-{x}[+/-{y}]])
#	-geometry "600x40-18+45" &
