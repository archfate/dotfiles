#Load dotfiles.
#for file in ~/.{aliases}; do
    #[ -r "$file" ] && [ -f "$file" ] && source "$file"
#done
#unset file

# Auto cd
shopt -s cdspell

## Case insensitive
shopt -s nocaseglob

## history control
shopt -s cmdhist

## check window size
shopt -s checkwinsize

# history verification
shopt -s histverify

# bash completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# alias
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# dircolors.
if [ -x "$(command -v dircolors)" ]; then
    eval "$(dircolors -b ~/.dircolors)"
fi

# Prompt
#PS1='\[\e[1;33m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

