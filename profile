#!/bin/sh
# ~/.bash_profile
#

figlet WELCOME $USER -f slant  | lolcat
export BROWSER="brave"
export TERMINAL="st"
export EDITOR="/usr/sbin/vim"
[[ -f ~/.bashrc ]] && . ~/.bashrc
export SUDO_ASKPASS="/home/$USER/.bin/rofi-askpass"
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
