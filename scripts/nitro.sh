#!/usr/bin/env bash

getArg() {
	case $arg in
		-a)
			set_type="--set-auto"
			;;
		-c)
			set_type="--set-centered"
			;;
		-s)
			set_type="--set-scaled"
			;;
		-t)
			set_type="--set-tiled"
			;;
		-z)
			set_type="--set-zoom"
			;;
		-zf)
			set_type="--set-zoom-fill"
			;;
		-w)
			file=cat ${HOME}/.cache/wal/wal
			set_type="--set-zoom-fill"
			;;
		*)
			echo "Invalid argument."
			exit
			;;
	esac
}

setImg() {
	nitrogen $set_type $file --save >/dev/null 2>&1
}

walls_folder="/mnt/FILES/Pictures/Walls/"
bg_saved="${HOME}/.config/nitrogen/bg-saved.cfg"

case $1 in
    -r)
        nitrogen --set-zoom-fill --random --save
        exit 0
        ;;
	-*)
		file=$(awk -F= '/^file/{print $2}' $bg_saved)
		arg=$1
		;;
	*)
		file=$walls_folder$1.jpg
		if [ -z ${2+x} ]; then
			echo "No argument. Set to default"
			set_type="--set-zoom-fill"
			setImg && exit
		else
			arg=$2
		fi
		;;
esac

getArg && setImg
