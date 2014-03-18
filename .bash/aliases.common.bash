alias screen='screen -T linux -s /bin/bash'

# svn
alias surl='svn info | grep URL'
alias svst='svn st --ignore-externals | grep -v ^X'

# debian
alias dch='dch --distributor debian'
alias debrelease='if [ -e dupload.conf ]; then debrelease -c --nomail; else debrelease --nomail; fi'

# editor
alias vim='vim -p'
alias svim='sudo vim'
alias e='vim'
alias se='sudo vim'

# grep
alias rgrep='grep -r --exclude=.git --exclude=\*.svn\*'
alias less='less -FRX'

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
