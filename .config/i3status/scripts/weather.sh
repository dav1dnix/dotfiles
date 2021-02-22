#!/bin/sh

python=$(python3 ~/.config/i3status/scripts/weather.py 2>&1) # Error to stdout

i3status -c  ~/.config/i3status/i3status.conf | while : # Forever while loop
do
  read line
  x=$(echo "$line")
  echo "$python | ""$x" || exit 1
done
