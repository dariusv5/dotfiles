#!/usr/bin/env bash

speed=$(sensors | grep 'fan2' | awk -F ' ' '{print substr($1,6,6),$2}' OFS=' ')
if [ "$speed" != "" ]; then
    speed_round=$(LANG=C printf "%.1fk" "$(echo "$speed/1000" | bc -l )")
    echo "$speed_round"
else
   echo "————"
fi
