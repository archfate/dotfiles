#--------Oh my Zsh {{{
#------------------------------------------------------
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
Enable_CORRECTION="true"

# Oh my zsh plugs
plugins=(
  fzf
)

source $ZSH/oh-my-zsh.sh
eval "$(fasd --init posix-alias zsh-hook)"

# }}}
#-------- Prompt {{{
#------------------------------------------------------
# https://wiki.archlinux.org/index.php/Zsh#Prompts

autoload -U promptinit && promptinit
prompt fade    # set prompt theme (for listing: $ prompt -p)

# }}}
#-------- Globbing {{{
#------------------------------------------------------
#
setopt extendedglob
unsetopt caseglob

# }}}
#-------- History {{{
#------------------------------------------------------
# get more info: $man zshoptions

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt INTERACTIVE_COMMENTS        # pound sign in interactive prompt
HISTFILE=~/.zsh_history            # where to save zsh history
HISTSIZE=10000
SAVEHIST=10000
cfg-history() { $EDITOR $HISTFILE ;}

#
# }}}
#-------- Autocomplete {{{
#------------------------------------------------------
# http://www.refining-linux.org/archives/40/ZSH-Gem-5-Menu-selection/
# https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/completion.zsh


autoload -U compinit && compinit        # enable autocompletion
fpath+=(~/.zsh/completion)              # set path to custom autocompletion
zstyle ':completion:*' menu select      # to activate the menu, press tab twice
unsetopt menu_complete                  # do not autoselect the first completion entry
setopt completealiases                  # autocompletion CLI switches for aliases
zstyle ':completion:*' list-colors ''   # show colors on menu completion

# http://unix.stackexchange.com/a/297000
setopt complete_in_word                 # tab completion from both ends
setopt glob_complete                    # wildcard completion eg. *-tar

# setopt auto_menu         # show completion menu on succesive tab press
# setopt always_to_end

# show dots if tab compeletion is taking long to load
expand-or-complete-with-dots() {
  echo -n "\e[31m......\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# autocomplete case-insensitive (all),partial-word and then substring
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# better completion for killall
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

# when new programs is installed, auto update autocomplete without reloading shell
zstyle ':completion:*' rehash true

#}}}
#-------- Fuzzy Finder {{{
#------------------------------------------------------
#

# function bind to a hotkey
fzf_history() { zle -I; eval $(history | fzf +s | sed 's/ *[0-9]* *//') ; }; zle -N fzf_history; bindkey '^F' fzf_history

fzf_killps() { zle -I; ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9} ; }; zle -N fzf_killps; bindkey '^Q' fzf_killps

fzf_cd() { zle -I; DIR=$(find ${1:-*} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf) && cd "$DIR" ; }; zle -N fzf_cd; bindkey '^E' fzf_cd
# }}}

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
if [[ -f ~/.aliasrc ]]; then
    source ~/.aliasrc
fi
