#!/usr/bin/env bash
# Simple script I use to queue a list for youtube-dl

LIST_FILE="/mnt/FILES/.backup/list.txt"
OUTPUT_DIR="/mnt/FILES/.backup/vid/"
NAME_FORMAT='%(title)s-%(id)s.%(ext)s'
LIST_EDITOR=gedit
# Print title after adding link
GET_TITLE=false

showHelp() {
	echo "List of valid arguments:"
	echo -e "-h\tShow this message"
	echo -e "-l\tShow full list in terminal"
	echo -e "-a\tAdd link from clipboard to the list"
	echo -e "-del\tDeletes last added link from list"
	echo -e "-e\tEdit list is external editor"
	echo -e "-start\tStart download queue"
}

printList(){
	cat $LIST_FILE
}

addLink() {
	local url
    url=$(xsel -ob)
	if [ ! ${url:0:4} == "http" ]; then echo -e "Invalid url?\n\n$url"; exit 1; fi
	echo "URL added: $url"
	echo $url >> $LIST_FILE
	if [ "$GET_TITLE" == "true" ]; then
		curl $url -so - | grep -iPo '(?<=<title>)(.*)(?=</title>)'
	fi
}

deleteLast() {
	sed -i '$ d' $LIST_FILE
}

editList() {
	$LIST_EDITOR $LIST_FILE
}

start() {
	youtube-dl -a $LIST_FILE -o $OUTPUT_DIR$NAME_FORMAT
	if [ $? -eq 0 ]; then
		notify-send -u "normal" "Dowloand Finished" "Youtube-dl has finished downloading the queue"
	else
		notify-send -u "critical" -t 10000 "ERROR: Youtube-dl Has Stopped" "Youtube-dl has exited with an error. \nCheck the console"
	fi
}



case $1 in
	-a)
		addLink
		;;
	-l)
		printList
		;;
	-del)
		deleteLast
		;;
	-e)
		editList
		;;
	-start)
		start
		;;
	-h)
		showHelp
		;;
	*)
		echo "Invalid argument"
		showHelp
		;;
esac
