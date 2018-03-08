#!/usr/bin/env bash
MAX_LENGTH=58
CUT_SUFFIX="..."

cmusstatus=$(cmus-remote -C status)
[ ! $? -eq 0 ] && exit

strindex() {
	x="${1%%$2*}"
	[[ "$x" = "$1" ]] && echo -1 || echo "${#x}"
}

get_all_but_first() {
	shift
	echo "$@"
}

get_stat() {
	line=$(grep "$1" -m 1 <<< "$cmusstatus")
	a=$(strindex "$line" "$1")
	sub="${line:a}"
	echo "$(get_all_but_first $sub)"
}

output="$(get_stat artist)  -  $(get_stat title)"

if [ ${#output} -gt $MAX_LENGTH ]; then
	cut_length=$(( $MAX_LENGTH-${#CUT_SUFFIX} ))
	output="$(echo $output | cut -c -$cut_length)$CUT_SUFFIX"
fi

echo -n $output
