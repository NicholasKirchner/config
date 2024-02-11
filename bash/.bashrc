# Colors
if [[ $- != *i* ]]; then
    return
fi

if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    source /opt/local/etc/profile.d/bash_completion.sh
fi

if [ -f $HOME/.asdf/completions/asdf.bash ]; then
    source $HOME/.asdf/completions/asdf.bash
fi

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export VCPROMPT_FORMAT="%n:%b%m%u"

export EDITOR="emacsclient -t -a ''"
export VISUAL="emacsclient -c -a ''"

export HISTSIZE='32768'
export HISTFILESIZE="${HISTSIZE}"
export MANPAGER='less -X'

alias cp='cp -iv'
alias mv='mv -iv'

alias .='cd ..'
alias ..='cd ../..'
alias ...='cd ../../..'

alias mkdir='mkdir -pv'
alias ll='ls -FGlAhp'

extract() {
    if [ -f $1 ] ; then
        case $1 in
        *.tar.bz2)   tar -xvjf  $1    ;;
        *.tar.gz)    tar -xvzf  $1    ;;
        *.tar.xz)    tar -xvJf  $1    ;;
        *.bz2)       bunzip2    $1    ;;
        *.rar)       rar x      $1    ;;
        *.gz)        gunzip     $1    ;;
        *.tar)       tar -xvf   $1    ;;
        *.tbz2)      tar -xvjf  $1    ;;
        *.tgz)       tar -xvzf  $1    ;;
        *.zip)       unzip      $1    ;;
        *.Z)         uncompress $1    ;;
        *.7z)        7z x       $1    ;;
        *)           echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

compress() {
    if [ -n "$1" ] ; then
        FILE=$1
        case $FILE in
        *.tar) shift && tar -cf $FILE $* ;;
        *.tar.bz2) shift && tar -cjf $FILE $* ;;
        *.tar.xz) shift && tar -cJf $FILE $* ;;
        *.tar.gz) shift && tar -czf $FILE $* ;;
        *.tgz) shift && tar -czf $FILE $* ;;
        *.zip) shift && zip $FILE $* ;;
        *.rar) shift && rar $FILE $* ;;
        esac
    else
        echo "usage: compress <foo.tar.gz> ./foo ./bar"
    fi
}

TERM_PROMPT_1=\
"\`if [ \$? = 0 ]; \
then echo \[\e[0\;33m\]:\)\[\e[m\]; \
else echo \[\e[0\;31m\]X\(\[\e[m\]; fi\` \
(\j)-\
\`if [ \$(id -u) -eq 0 ]; \
then echo \(\[\e[0\;31m\]\u@\h\[\e[m\]\); \
else echo \(\[\e[0\;32m\]\u@\h\[\e[m\]\); fi\`-\
(\[\e[0;35m\]\w\[\e[m\])-\
(\[\e[0;33m\]\$(vcprompt)\[\e[m\])\n$ "

#Title the GUI windows, if have GUI terminal
case $TERM in
    xterm*|rxvt|Eterm|eterm)
        PS1="\[\e]0;\W\a\]$TERM_PROMPT_1"
        ;;
    *)
        PS1="$TERM_PROMPT_1"
        ;;
esac

export PS1
export TERM_PROMPT_1
