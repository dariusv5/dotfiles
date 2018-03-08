#!/usr/bin/env bash

# Source pywal colors
. "${HOME}/.cache/wal/colors.sh"

pkill dunst
dunst \
	-lb "${color0}" \
	-lf "${color15}" \
	-lfr "${color3}" \
	-nb "${color0}" \
	-nf "${color15}" \
	-nfr "${color3}" \
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
