#!/bin/sh

setbg &
xrandr --output DP-1 --auto --left-of eDP-1 &
setxkbmap us &
nm-applet &
picom &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
dunst > /dev/null 2>&1 &
fbxkb &
sxhkd &
unclutter &
wal -R
ssh-agent dwm 
