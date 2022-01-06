#!/bin/bash
#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
#nice
#figlet WELCOME BACK  $USER -f slant -n | lolcat
#nice

case $- in
    *i*) ;;
      *) return;;
esac

export INPUTRC=~/.inputrc
set -o vi


# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# (cat /home/$USER/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)

# To add support for TTYs this line can be optionally added.
#source ~/.cache/wal/colors-tty.sh
#source /home/$USER/nerd-fonts/bin/scripts/lib/i_all.sh
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

unset color_prompt force_color_prompt


GREEN="\[$(tput setaf 1)\]"
RESET="\[$(tput sgr0)\]"

reset=$(tput sgr0)
boldgreen=$(tput setaf 2)$(tput bold)
cyan=$(tput sgr0)$(tput setaf 6)
boldred=$(tput setaf 1)$(tput bold)
boldwhite=$(tput setaf 7)$(tput bold)
boldyellow=$(tput setaf 3)$(tput bold)

PARENCLR=$'\001\e[0;36m\002'
BRANCHCLR=$'\001\e[1;33m\002'

alias branchname="git branch 2>/dev/null | sed -ne 's/^* \(.*\)/ \1/p'"

GIT_STATUS='$(branchname)'

PROMPT_CHAR="\$"
if [ "$TERM" != "linux" ];then
    export PS1="\[$(tput setab 2)\]\[$(tput setaf 15)\] \u\[$(tput setaf 2)\]\[$(tput setab 1)\]$(echo "")\[$(tput setaf 15)\]@\[$(tput setab 15)\]\[$(tput setaf 1)\]$(echo "")\h\[$(tput setaf 15)\]\[$(tput setab 3)\]$(echo "")\[$(tput bold)\] \W \[$(tput setab 5)\]\[$(tput setaf 3)\]$(echo "")\[$(tput setaf 7)\]$GIT_STATUS\[$(tput sgr0)\]\[$(tput setaf 5)\]$(echo "")\[$(tput sgr0)\]$PROMPT_CHAR "
else

export PS1="\[$boldgreen\]\u\[$cyan\]@\[$boldred\]\h \[$cyan\]{\[$boldwhite\]\W\[$cyan\]}\[$reset\]$GIT_STATUS\[$reset\]$PROMPT_CHAR "
#    else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
fi

# enable color support of ls and also add handy aliases

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias la='ls -A'
#alias l='ls -CF'
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}


complete -cf sudo







export PATH=$PATH:/home/$USER/.bin
export PATH=$PATH:/home/$USER/mutt-wizard/bin

eval "$(thefuck --alias)"
