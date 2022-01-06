#!/bin/sh

# A dwm_bar function that displays the current keyboard layout
# Joe Standring <git@joestandring.com>
# GNU GPLv3
export IDENTIFIER="unicode"
# Dependencies: xorg-setxkbmap

dwm_keyboard () {
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "⌨️ %s" "$(setxkbmap -query | awk '/layout/{print $2}')"
    else
        printf "KEY %s" "$(setxkbmap -query | awk '/layout/{print $2}')"
    fi
    printf "%s\n" "$SEP2"
}

dwm_keyboard
