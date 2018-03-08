#!/usr/bin/env bash

bspc rule -a Termite -o desktop='^4' split_ratio="0.70"
termite -e "fish -c cmus" &
sleep 0.05
bspc rule -a Termite -o desktop='^4' split_dir="east" split_ratio="0.70"
termite -e "fish -c lyvi" &
sleep 0.05
bspc rule -a Termite -o desktop='^4' split_dir="south" split_ratio="0.80"
termite -e "fish -c cava" &
sleep 0.05
