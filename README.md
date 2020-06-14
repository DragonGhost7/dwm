# dwm - dynamic window manager
============================
dwm is an extremely fast, small, and dynamic window manager for X.

My slight modifications. No bork.
A lot of patches were manually forced upon the system.

You can find some of them in the `patches` directory


## Requirements
------------
In order to build dwm you need the Xlib header files.


## Installation
------------
Edit config.mk to match your local setup (dwm is installed into
the /usr/local namespace by default).

Afterwards enter the following command to build and install dwm (if
necessary as root):

    make clean install


## Running dwm
-----------
Check my dots, i run dwm thru `startx`
[dots](https://github.com/DragonGhost7/dotfiles)

## Configuration
-------------
The configuration of dwm is done by creating a custom config.h
and (re)compiling the source code.
