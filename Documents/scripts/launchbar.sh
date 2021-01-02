#!/usr/bin/env sh
killall -q lemonbar
killall -q launchbar.sh

./bar.sh | lemonbar -p -f 'JetBrainsMono Nerd Font Mono' -f 'Font Awesome 5 Free' -f 'Font Awesome 5 Brands' -f 'Font Awesome 5 Free Solid' &
