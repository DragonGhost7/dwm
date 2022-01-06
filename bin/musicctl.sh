#!/bin/bash

p="$(cat ~/.cache/current_player)"
if [ $1 = "n" ];
then
	playerctl -p $p next
elif [ $1 = "p" ];
then
	playerctl -p $p play-pause
elif [ $1 = "b" ];
then
	playerctl -p $p previous
fi

