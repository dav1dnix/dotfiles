#!/usr/bin/env sh
wallpapers="$HOME/Pictures/bg"
bg=$(find "$wallpapers" -type f | shuf | head -n 1) &&
exec feh --bg-scale "$bg"
