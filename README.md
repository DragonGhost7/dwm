# My dotfiles

This is master branch, all here should work, please dont use `i3` its abandonned and pretty much broken

## Installation

For installation of dotfiles, I use `bashdot`. Written in bash cli utility to install dotfiles.

Steps then would be to first clone this repo:

```
cd ~/
git clone https://github.com/DragonGhost7/dotfiles.git
```

Then install bashdot from their github because it's literally one file, it doesnt need a package.

```
curl -s https://raw.githubusercontent.com/bashdot/bashdot/master/bashdot > bashdot
sudo mv bashdot /usr/local/bin
sudo chmod a+x /usr/local/bin/bashdot
```
( yanked from their github please dont sue me ).

Then proceed with installation of the dotfiles directory.

```
bashdot install dotfiles
```
It should create symlinks for all the files in the repo to their respective places in the home directory.

Right now present:
- Xdefaults
- vimrc
- zshrc + oh-my-zsh
- bashrc
- mpd configs
- xinitrc
- sxhkdrc
- dwm

## dwm autoexec folder

Inside you will find my statusbar updaters ( for my dwmblocks build )

## bin

My sctipts and apps, dont use a lot of them. Note the `statusbar` folder with all scripts for dwmblocks

**If any of them break your system don't blame me pls.**

Have fun
