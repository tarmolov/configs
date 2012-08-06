alias screen='screen -T linux -s /bin/bash'
alias grep='grep -r --exclude=.git --exclude=\*.svn\*'
alias surl='svn info | grep URL'
alias svst='svn st --ignore-externals | grep -v ^X'
alias dch='dch --distributor debian'
alias debrelease='if [ -e dupload.conf ]; then debrelease -c --nomail; else debrelease --nomail; fi'
alias make='make -B'
alias less='less -R'
alias ducks="du -cks * | sort -rn | head -n11"
alias vim='vim -p'
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
