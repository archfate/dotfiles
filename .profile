#export PATH="$(du $HOME/.scripts/ | cut -f2 | tr '\n' ':')$PATH"
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export EDITOR="nvim"
export TERMINAL="st"
#export TERM="st-256color"
export BROWSER="firefox"
export BROWSERCLI="w3m"
export READER="zathura"

# Startx
if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep -x i3 || exec startx
fi

if [ -f ~/.bashrc ]; then source ~/.bashrc; fi

