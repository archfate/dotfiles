#!/bin/sh
#export PATH="$(du $HOME/.scripts/ | cut -f2 | tr '\n' ':')$PATH"
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"
#export TERM="st-256color"
export BROWSER="firefox"
export BROWSERCLI="w3m"
export READER="zathura"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse-list --border --color=light'
export RTV_BROWSER=~/.scripts/urlportal

PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

if [ -f ~/.bashrc ]; then source ~/.bashrc; fi

if [[ -f ~/.aliasrc ]]; then
    source ~/.aliasrc
fi
if [ -x "$(command -v dircolors)" ]; then
    eval "$(dircolors -b ~/.dircolors)"
fi

# Startx
if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep -x dwm || exec startx
fi

setxkbmap -option caps:escape
