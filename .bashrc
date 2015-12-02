[ -z "$PS1" ] && return

export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# mac-specific
if [ "$(uname -s)" = "Darwin" ]; then
    # cli colors
    export CLICOLORS=yes
    export LSCOLORS='ExGxFxdaCxDADAhbadecad'
    export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8"
  
    if [ -f ~/.bash.d/osx ]; then
      . ~/.bash.d/osx
    fi
fi

# Change the window title of X terminals
case $TERM in
    aterm|eterm|*xterm*|konsole|kterm|rxvt*|wterm)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/$HOME/~}\007"'
        ;;
    screen*)
        PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}    \033\\"'
        ;;
esac

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi

if [ -f ~/.bash.d/mvn_bash_completion.bash ]; then
    . ~/.bash.d/mvn_bash_completion.bash
fi

if [ -f ~/.bash.d/docker_bash_completion.bash ]; then
    . ~/.bash.d/docker_bash_completion.bash
fi

# enable completion for pip
if [[ -x $(which pip) ]]
then
    eval "`pip completion --bash`"
fi

# colored prompt
export PS1='\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[1;30m\]$(__git_ps1)\[\e[0m\]\$ '

export PAGER=less
export MANPAGER=less

if [[ ${BASH_VERSINFO[0]} -eq 4 ]] && [[ ${BASH_VERSINFO[1]} -ge 3 ]] || [[ ${BASH_VERSINFO[0]} -gt 4 ]]; then
    export HISTSIZE=-1 #
    export HISTFILESIZE=-1
else
    export HISTSIZE=500000
    export HISTFILESIZE=500000
fi
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S '
export GREP_OPTIONS="--color=auto"
export PROMPT_COMMAND="history -a && history -c && history -r && $PROMPT_COMMAND" # append to and reread histfile on prompt

# colorize manpages in less
export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[0;34m' # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end bold
export LESS_TERMCAP_so=$'\E[01;40;33m' # begin standout mode
export LESS_TERMCAP_se=$'\E[0m' # end standout mode
export LESS_TERMCAP_us=$'\E[0;36m' #begin underline
export LESS_TERMCAP_ue=$'\E[0m' # end underline

# Useful functions
function mkcd() { mkdir "$1" && cd "$1"; }
function calc() { echo "$*" | bc; }
function hex2dec { awk 'BEGIN { printf "%d\n",0x$1}'; }
function dec2hex { awk 'BEGIN { printf "%x\n",$1}'; }
function mktar() { tar czf "${1%%/}.tar.gz" "${1%%/}/"; }
function rot13 () { echo "$@" | tr a-zA-Z n-za-mN-ZA-M; }

# extract files based on file extension
function x() {
    for arg in $@
    do
        if [ -f $arg ]
        then
            case $arg in
                *.tar.bz2)  tar xjvf $arg     ;;
                *.tar.gz)   tar xzvf $arg     ;;
                *.tar.xz)   tar xJvf $arg     ;;
                *.bz2)      bunzip2 -v $arg   ;;
                *.rar)      unrar x $arg      ;;
                *.gz)       gunzip -v $arg    ;;
                *.tar)      tar xvf $arg      ;;
                *.tbz2)     tar xjvf $arg     ;;
                *.tgz)      tar xzvf $arg     ;;
                *.txz)      tar xJvf $arg     ;;
                *.zip)      unzip $arg        ;;
                *.jar)      jar xvf $arg      ;;
                *.Z)        uncompress $arg   ;;
                *.xpi)      unzip $arg        ;;
                *.7z)       7z x $arg         ;;
                *.crx)       unzip $arg       ;;
                *)          echo "'$arg' cannot be extracted via x (extract)" ;;
            esac
        else
            echo "'$arg' is not a valid file"
        fi
    done
}

# path
PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/python:$PATH
PATH=/Users/mkr/ok_dir/scripts/katalog:$PATH
if [ -d $HOME/.rvm/bin ]; then
    PATH=$PATH:/$HOME/.rvm/bin
fi

