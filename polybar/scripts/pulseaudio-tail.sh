#!/usr/bin/env bash

SINK=0
MAX_VOL=100

volume_up() {
	vol=$(pamixer --sink $SINK --get-volume)
	if [ ! $vol -ge $MAX_VOL ]; then
		if [ $1 -eq 5 ] && [ $vol -gt $(($MAX_VOL-5)) ]; then
			pactl set-sink-volume $SINK $MAX_VOL%
		else
			pactl set-sink-volume $SINK +$1%
		fi
	fi
}

volume_down() {
	pactl set-sink-volume $SINK -$1%
}

volume_mute() {
    pactl set-sink-mute $SINK toggle
}

volume_print() {
    muted=$(pamixer --sink $SINK --get-mute)

    if [ "$muted" = true ]; then
        echo "——"
    else
        volume=$(pamixer --sink $SINK --get-volume)
        echo "$volume"
    fi
}

listen() {
    volume_print

    pactl subscribe | while read -r event; do
        if echo "$event" | grep -q "#$SINK"; then
            volume_print
        fi
    done
}

case "$1" in
	--up)
        [ $2 -eq 5 ] && volume_up "5" || volume_up "1"
        ;;
    --down)
        [ $2 -eq 5 ] && volume_down "5" || volume_down "1"
        ;;
    --mute)
        volume_mute
        ;;
    *)
        listen
        ;;
esac
