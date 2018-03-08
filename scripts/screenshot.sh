#!/usr/bin/env bash

#if [ ! -p /tmp/scr ]; then mkfifo /tmp/scr; fi
maim $1 --format png /tmp/scr
[ ! $? -eq 0 ] && exit
xclip -selection clipboard -t image/png -i /tmp/scr
notify-send -u "low" -t 1500 "Copied!" "Screenshot copied to the clipboard"
rm /tmp/scr
