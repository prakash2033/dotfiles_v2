#!/bin/sh

export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export EDITOR="vim"

[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx
