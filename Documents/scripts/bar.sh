#!/bin/bash

trap 'Update' 5

Desktop() {
  # This assumes you're running openbox wm
  a=$(xprop -id 0x137 | grep _NET_CURRENT_DESKTOP -m 1 | cut -d " " -f 3 )
  echo -n $(($a+1))
}

Clock() {
  time=$(date "+%T" )
  echo -n -e "\uf017 $time"
}

Storage() {
  storage=$(du -sh $HOME | cut -d / -f 1 )
  echo -n -e "\uf0a0 $storage"
}

CPU() {
  # shamefully stolen from https://stackoverflow.com/a/9229692 😔 (may not be accurate on all systems as commented by mklement0)
  # .* - any char except newline
  # *\ - escape special character
  # [0-9.] - find any number between 0 and 9, also find a .
  # sed -n 2p - get second line of output (avoids getting the first line of output)
  cpuusage=$(top -bn2 | grep Cpu | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{ print 100 - $1"%" }' | sed -n 2p )
  echo -n -e "\uf2db $cpuusage"
}

Memory() {
  memory=$(free -m | awk '/Mem:/ {print $3"/"$7}' )
  echo -n -e "\uf538 $memory"
}

Volume() {
  volume=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master) | cut -d% -f1)
  if [ "$volume" -gt 50 ]; then
    echo -n -e "\uf028 $volume%"
  elif [ "$volume" -ge 1 ]; then
    echo -n -e "\uf027 $volume%"
  else
    echo -m -e "\uf027 $volume%"
  fi
}

WiFi() {
  wireless=$(iwgetid -r )
  echo -n -e "\uf1eb $wireless"
}

Update() {
  echo "%{l}%{F#FFFFFF}%{B#6A6A6A} $(Desktop) %{c} $(Clock) %{r} $(Storage) | $(CPU) | $(Memory) | $(WiFi) | $(Volume) %{F-}%{B-}"
}

while true; do
  Update
  sleep 0.1s
done
