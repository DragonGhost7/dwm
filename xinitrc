#!/bin/bash
#__  ___       _ _
#\ \/ (_)_ __ (_) |_
# \  /| | '_ \| | __|
# /  \| | | | | | |_
#/_/\_\_|_| |_|_|\__|
# Init file.
# yay
eval $(ssh-agent)
export $(dbus-launch --exit-with-x11)
dunst > /dev/null 2>&1  &
~/.bin/setbg /home/$USER/.config/wall.png
sxhkd -c /home/$USER/.sxhkdrc &

xrdb load  $HOME/.Xdefaults

pulseaudio -D
# dwm start
dwmblocks &
compton &
mpd
mpDris2 &

while :; do
	dwm || break
done
