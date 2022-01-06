#!/usr/bin/env python3
#Author: Marcin Kocur, attribution license: https://creativecommons.org/licenses/by/4.0/
import subprocess
import os
import sys
x=0
y=0
env = os.environ
env['LANG'] = 'en_US'
app = '"Spotify"'
pactl = subprocess.check_output(['pactl', 'list', 'sink-inputs'], env=env).decode().strip().split()
if app in pactl:
    for e in pactl:
        x += 1
        if e == app:
            break
    for i in pactl[0 : x -1 ]:
        y += 1
        if i == 'Sink' and pactl[y] == 'Input' and '#' in pactl[y + 1]:
            sink_id = pactl[y+1]
        if i == 'Volume:' and '%' in pactl[y + 3]:
            volume = pactl[y + 3]
    sink_id = sink_id[1: ]
    volume = volume[ : -1 ]
    if int(volume) < 100:
        subprocess.run(['pactl', 'set-sink-input-volume', sink_id, sys.argv[1]])
else:
    print("no spotify")
    mpv = subprocess.check_output(['mpc'], env=env).decode().strip().split()
    if '[playing]' in mpv:
        print("found mpv")
        subprocess.run(['mpc' , 'volume', sys.argv[1][:-1]])
