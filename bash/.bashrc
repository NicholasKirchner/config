# Colors
if [[ $- != *i* ]]; then
    return
fi

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export VCPROMPT_FORMAT="%n:%b%m%u"

export EDITOR="emacsclient -t -a ''"
export VISUAL="emacsclient -c -a ''"

alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ll='ls -FGlAhp'


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

if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

if [ -f $HOME/.asdf/completions/asdf.bash ]; then
    . $HOME/.asdf/completions/asdf.bash
fi
