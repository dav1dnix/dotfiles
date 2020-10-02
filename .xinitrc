#!/usr/bin/env sh

config() {
  {
    sleep 3; xrandr --output HDMI-1 --mode 1920x1080 --rate 60
  } &
  xrdb -merge ~/.Xresources &
  feh --bg-scale $HOME/Firefox_wallpaper.png &
}

# Select DE/WM to use
session=${1:-gnome}

case $session in
  openbox)
    config && exec openbox ;;
  gnome)
    config && exec gnome-session ;;
  bspwm)
    config && exec bspwm ;;
  xmonad)
    config && exec xmonad ;;
  awesome)
    config && exec awesome --no-argb ;; # Fix screen tearing
  *)
    exec $1 ;;
esac
