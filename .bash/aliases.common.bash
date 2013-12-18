# common
alias bc='bc -l' # start calculator with math support
alias cmpf="complete -F"
alias screen='screen -T linux -s /bin/bash'
alias mkdir='mkdir -pv' # create parent directories on demand
alias diff='colordiff'
alias path='echo -e ${PATH//:/\\n}'

# svn
alias surl='svn info | grep URL'
alias svst='svn st --ignore-externals | grep -v ^X'

# debian
alias dch='dch --distributor debian'
alias debrelease='if [ -e dupload.conf ]; then debrelease -c --nomail; else debrelease --nomail; fi'

# editor
alias vi=vim
alias vim='vim -p'
alias svim='sudo vim'
alias e='vim'

# grep
alias rgrep='grep -r --exclude=.git --exclude=\*.svn\*'
alias less='less -FRX'

# ls
alias ll='ls -la'
alias l.='ls -d .* --color=auto'

# cd
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

alias wget='wget -c' # resume by default
alias df='df -H'
alias du='du -ch'
alias ducks="du -cks * | sort -rn | head -n11"

sdiff() {
    svn diff --no-diff-deleted $@ | colordiff | less -SR
}

# Set appropriate ls alias
case $(uname -s) in
    Darwin|FreeBSD)
            alias ls="ls -hFG"
    ;;
    Linux)
            alias ls="ls --color=always -hF"
    ;;
    NetBSD|OpenBSD)
            alias ls="ls -hF"
    ;;
esac
