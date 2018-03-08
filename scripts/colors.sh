#!/bin/bash

colorsFile=${HOME}/.cache/wal/colors
colorPanes=${HOME}/dotfiles/scripts/colorpanes.sh

$colorPanes

# Color variables
RED="\033[0;31m";		RED_B="\033[1;31m";
GREEN="\033[0;32m";		GREEN_B="\033[1;32m";
YELLOW="\033[0;33m";	YELLOW_B="\033[1;33m";
BLUE="\033[0;34m";		BLUE_B="\033[1;34m";
PURPLE="\033[0;35m";	PURPLE_B="\033[1;35m";
CYAN="\033[0;36m";		CYAN_B="\033[1;36m";
GRAY="\033[0;37m";		WHITE="\033[1;37m";
BLACK="\033[0;30m";		DARKGRAY="\033[1;30m";


# Read HEX colors
i=0
colors[16]=
while read line; do
	colors[$i]=$line
	i=$(($i+1))
done < $colorsFile

echo -e "\n"
echo -e "${BLACK}BLACK\t${colors[0]}\t\t${DARKGRAY}DARK_GRAY\t${colors[8]}"
echo -e "${RED}RED\t${colors[1]}\t\t${RED_B}LIGHT_RED\t${colors[9]}"
echo -e "${GREEN}GREEN\t${colors[2]}\t\t${GREEN_B}LIGHT_GREEN\t${colors[10]}"
echo -e "${YELLOW}YELLOW\t${colors[3]}\t\t${YELLOW_B}LIGHT_YELLOW\t${colors[11]}"
echo -e "${BLUE}BLUE\t${colors[4]}\t\t${BLUE_B}LIGHT_BLUE\t${colors[12]}"
echo -e "${PURPLE}PURPLE\t${colors[5]}\t\t${PURPLE_B}LIGHT_PURPLE\t${colors[13]}"
echo -e "${CYAN}CYAN\t${colors[6]}\t\t${CYAN_B}LIGHT_CYAN\t${colors[14]}"
echo -e "${GRAY}GRAY\t${colors[7]}\t\t${WHITE}WHITE\t\t${colors[15]}"
echo -e "\n"
