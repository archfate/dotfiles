
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#[ $- != *i* ]] && return
# Path to your oh-my-zsh installation.
export ZSH="/$HOME/.oh-my-zsh"
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
DISABLE_AUTO_UPDATE=true

plugins=(
    git
    urltools
    vi-mode
    fzf
    )
source $ZSH/oh-my-zsh.sh
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

autoload -U compinit
zstyle ':completion:*' menu select
setopt completealiases
zmodload zsh/complist
compinit

# Include hidden files in autocomplete:
_comp_options+=(globdots)
# User configuration
# No delay insert mode
export KEYTIMEOUT=1
#-------- Exports {{{
#------------------------------------------------------
# set display
export DISPLAY=:0

# set 256color support (doesnt work with older apps like abook)
export TERM="screen-256color"
# export TERM="xterm-256color"

# fix vlc no video issue
export VDPAU_DRIVER=va_gl
#}}}

#-------- Keybinding {{{
#------------------------------------------------------
# Copy command to clipboard (Ctrl+x)
zle -N copyx; copyx() { echo -E $BUFFER | xsel -ib }; bindkey '^X' copyx

# manpages for keybindings: $man zshzle

# partial history search using up and down arrow keys
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Bang! Previous Command Hotkeys
# print previous command but only the first nth arguments
# Alt+1, Alt+2 ...etc
# http://www.softpanorama.org/Scripting/Shellorama/bash_command_history_reuse.shtml#Bang_commands
bindkey -s '\e1' "!:0 \t"        # last command
bindkey -s '\e2' "!:0-1 \t"      # last command + 1st argument
bindkey -s '\e3' "!:0-2 \t"      # last command + 1st-2nd argument
bindkey -s '\e4' "!:0-3 \t"      # last command + 1st-3rd argument
bindkey -s '\e5' "!:0-4 \t"      # last command + 1st-4th argument
bindkey -s '\e`' "!:0- \t"       # all but the last argument
bindkey -s '\e9' "!:0 !:2* \t"   # all but the 1st argument (aka 2nd word)


#}}}

# Fish like Suggestion and syntax highlighting features.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# interactive with .profile
if [[ -f "$HOME/.profile" ]]; then
    source "$HOME/.profile"
fi
