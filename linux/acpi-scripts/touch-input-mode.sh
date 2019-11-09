#!/bin/sh
set -e

# Ensure stable parsing
#LANG=C

# Check argument
echo "$1" | grep -q '[01]'

# Get and export the current user's $DISPAY
#export DISPLAY="$(w -f | awk 'NF > 7 && $2 ~ /tty[0-9]+/ {print $3; exit}' 2>/dev/null)"

# Get and export the currentuser's $XAUTHORITY
#export XAUTHORITY="/home/$(w -f | awk 'NF > 7 && $2 ~ /tty[0-9]+/ {print $1; exit}' 2>/dev/null)/.Xauthority"

# Find the TouchPad device ID
IDS="$(xinput | grep -ioP 'touch.*id=\K[0-9]*')"

# Check if to turn on/off touch inputs
MODE=$(test "$1" == 0 && echo disable || echo enable)
for id in $IDS; do xinput $MODE "$id"; done
