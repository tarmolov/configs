#!bash

if [ -f ~/.bashrc ] && [ ! -L ~/.bashrc ]; then
   . ~/.bashrc
fi

. ~/.configs/.bash/git-completion.bash
. ~/.configs/.bash/git-flow-completion.bash

export LESSCHARSET=utf-8
export EDITOR=vim
export PS1='\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\]\[\e[1;32m\]$(__git_ps1 " (%s)") \$\[\e[m\] \[\e[1;37m\]'

# Aliases
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

# git aliases (based on TJ Holowaychuk's aliases)
alias gd="git di"
alias gdc="git dic"
alias ga="git add"
alias gbd="git branch -D"
alias gst="git status"
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gm="git merge --no-ff"
alias gpt="git push --tags"
alias gp="git push"
alias grh="git reset --hard"
alias gb="git branch"
alias gcob="git checkout -b"
alias gco="git checkout"
alias gba="git branch -a"
alias gcp="git cherry-pick"
alias glg="git lg"
alias gh="git hist"
alias gpom="git pull origin master"
alias gcd='cd "`git rev-parse --show-toplevel`"'

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

# Use local bin before
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

. ~/.configs/.bash/autoscreen.bash

if git --version 2>&1 >/dev/null; then
    . ~/.configs/.bash/autoupdate.bash
fi
