#!/bin/bash

MUSIC_DIR=/home/$USER/Music/

eyeD3 -v $MUSIC_DIR/"$(mpc current -f %file%)" | grep lyrics && echo "Lyrics already written" || eyeD3 --add-lyrics $MUSIC_DIR/.lyrics/"$(mpc current).txt":lyrics $MUSIC_DIR"$(mpc current -f %file%)"
