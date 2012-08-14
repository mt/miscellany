# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
HISTSIZE=10000;
HISTTIMEFORMAT='[%F %T %a]'

# we loves our precious vi-mode
set -o vi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    
    export PROMPT_COMMAND='PSTS=$(date +"%Y-%h-%d %T")'

    if [ -r ~/.bash_colors ]; then
        source ~/.bash_colors
        export PS1="\n${yellow}\$PSTS${none} \u@${cyan}\h${none}:\w\n${lightRed}\$?${none}; \$ ";
    else

        H=`tput smso` #Turn on Hilight
        B=`tput bold` #Turn on bold
        U=`tput smul` #Start underscore
        X=`tput sgr0` #Turn off all attributes

        PS1="\n\$PSTS \u@\h:$H\w$X\n$B\$?$X; \$ "; export PS1
    fi

    ;;
*)
    ;;
esac

VISUAL=vim; EDITOR=vim; FCEDIT=vim; PAGER=less;
export VISUAL EDITOR FCEDIT PAGER

[ -e ~/local/bin ] && PATH=~/local/bin:$PATH

export PATH

[ -x /usr/bin/dircolors ] && eval "`dircolors -b`"

[ -f /etc/bash_completion ] && . /etc/bash_completion
[ -f ~/.bash_completion ]   && . ~/.bash_completion
[ -f ~/.bash_aliases ]      && . ~/.bash_aliases
[ -f ~/.bash_functions ]    && . ~/.bash_functions
