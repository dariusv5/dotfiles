#!/usr/bin/env bash
VERSION="snapshot"
bspc rule -a Vivaldi-$VERSION -o desktop='^3'
vivaldi-$VERSION &
