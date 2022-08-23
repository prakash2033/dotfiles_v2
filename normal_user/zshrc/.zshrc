#         _              
# _______| |__  _ __ ___ 
#|_  / __| '_ \| '__/ __|
# / /\__ \ | | | | | (__ 
#/___|___/_| |_|_|  \___|
# prakash2033 (@gmail|twitter|youtube|github|lbry)

#-------- Prompt {{{
#------------------------------------------------------
# -- Install spaceship prompt with npm install -g spaceship-prompt
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_VI_MODE_SHOW=false

fpath=( "${ZDOTDIR:-$HOME}/.zfunctions" $fpath )

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# }}}
#-------- Globbing {{{
#------------------------------------------------------

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
#-------- Vim Mode {{{
#------------------------------------------------------
# enable vim mode on commmand line
bindkey -v

# edit command with editor
# http://stackoverflow.com/a/903973
# usage: type someshit then hit Esc+v
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# no delay entering normal mode
# https://github.com/pda/dotzsh/blob/master/keyboard.zsh#L10
# 10ms for key sequences
KEYTIMEOUT=1

# show vim status
# http://zshwiki.org/home/examples/zlewidgets
function zle-line-init zle-keymap-select {
    # RPS1="$vcs_info_msg_0_ ${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# add missing vim hotkeys
# fixes backspace deletion issues
# http://zshwiki.org/home/zle/vi-mode
bindkey -a u undo
# bindkey -a '^R' redo  # conflicts with history search hotkey
bindkey -a '^T' redo
bindkey '^?' backward-delete-char #backspace

# history search in vim mode
# http://zshwiki.org./home/zle/bindkeys#why_isn_t_control-r_working_anymore
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

# }}}
#-------- Autocomplete {{{
#------------------------------------------------------
# http://www.refining-linux.org/archives/40/ZSH-Gem-5-Menu-selection/
# https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/completion.zsh


autoload -U compinit && compinit        # enable autocompletion
fpath+=(~/.zsh/completion)              # set path to custom autocompletion
zstyle ':completion:*' menu select      # to activate the menu, press tab twice

# do not autoselect the first completion entry
unsetopt menu_complete

# autocompletion CLI switches for aliases
setopt completealiases

zstyle ':completion:*' list-colors ''   # show colors on menu completion

# http://unix.stackexchange.com/a/297000
# tab completion from both ends
setopt complete_in_word
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
#-------- Suffix Alias {{{
#------------------------------------------------------
# open file with default program base on extension
# Ex: 'alias -s avi=mplayer' makes 'file.avi' execute 'mplayer file.avi'
background() { nohup "$@" >/dev/null 2>&1& }   # background a process w/o error msg filling screen

alias -s {avi,flv,mkv,mp4,mpeg,mpg,ogv,wmv}=$PLAYER
alias -s {flac,mp3,ogg,wav}=$MUSICER
alias -s {gif,GIF,jpeg,JPEG,jpg,JPG,png,PNG}="background $IMAGEVIEWER"
alias -s {djvu,pdf,ps}="background $READER"
alias -s txt=$EDITOR
alias -s epub="background $EBOOKER"
alias -s {cbr,cbz}="background $COMICER"
# might conflict with emacs org mode
alias -s {at,ch,com,de,se,net,org}="background $BROWSER"

# archive extractor
alias -s ace="unace l"
alias -s rar="unrar l"
alias -s {tar,bz2,gz,xz}="tar tvf"  #tar.bz2,tar.gz,tar.xz
alias -s zip="unzip -l"

#}}}
#-------- Expanding Alias {{{
#------------------------------------------------------
# Expanding aliases in zsh
# source: http://wiki.math.cmu.edu/iki/wiki/tips/20140625-zsh-expand-alias.html
# typeset -a ealiases
# ealiases=()
# ealias() {
#   alias $1
#   ealiases+=(${1%%\=*})
# }
# expand-ealias() {
#   if [[ $LBUFFER =~ "(^|[;|&])\s*(${(j:|:)ealiases})\$" ]]; then
#     zle _expand_alias
#     zle expand-word
#   fi
#   zle magic-space
# }
# zle -N expand-ealias
# # bindkey -M viins ' '  expand-ealias   # space to expand
# bindkey -M viins '^[[Z' expand-ealias   # shift-tab to expand
# bindkey -M viins '^ '   magic-space     # control-space to bypass completion
# bindkey -M isearch " "  magic-space     # normal space during searches
#
# # Expandable Alias
# ealias TSP='TS_SOCKET=/tmp/ranger tsp'




# }}}
# -------- Source External Files {{{
#------------------------------------------------------
# source all files in function directory
if [ -d "$HOME/.config/function" ]; then
  for f in "$HOME"/.config/function/*
    do source "$f"
  done
fi

#}}}
#-------- Keybinding {{{
#------------------------------------------------------
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

# history search fzf widget
# references: https://github.com/junegunn/fzf/wiki/examples#locate
fzf-history-widget() {
  local selected
  if selected=$( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf -q "$LBUFFER" +s -e -i --tac --height 10% | sed 's/ *[0-9]* *//' ); then
    LBUFFER=$selected
  fi
  zle redisplay
}
zle     -N   fzf-history-widget
bindkey '^R' fzf-history-widget


#}}}
#-------- Fzf Dmenu {{{
bindkey -s '^O' "fzf-dmenu\n"

fzf-dmenu() { 
        # note: xdg-open has a bug with .desktop files, so we cant use that shit
        selected="$(ls /usr/share/applications | fzf -e)"
        nohup `grep '^Exec' "/usr/share/applications/$selected" | tail -1 | sed 's/^Exec=//' | sed 's/%.//'` >/dev/null 2>&1&
}
# }}}
#-------- Options {{{
# # http://linux.die.net/man/1/zshoptions
#
# # Options
# # http://stackoverflow.com/a/171564
setopt AUTO_CD           # instead of 'cd folder' if you could just type 'folder'
# setopt MULTIOS           # now we can pipe to multiple outputs!
# setopt CORRECT           # spell check commands!  (Sometimes annoying)
setopt AUTO_PUSHD        # This makes cd=pushd
# setopt AUTO_NAME_DIRS    # This will use named dirs when possible

# # }}}
#-------- For youtube-dl playback {{{
unsetopt nomatch
# }}}
# -------- Perl for YouTube-Viewer {{{

PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

# }}}
# -------- Node version manager {{{

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads     ↪nvm bash_completion

# }}}
