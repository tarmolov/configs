#!bash

if [ -f ~/.bashrc ] && [ ! -L ~/.bashrc ]; then
   . ~/.bashrc
fi

export TERM=linux
export LESSCHARSET=utf-8
export EDITOR=vim
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\]\[\e[1;32m\]$(__git_ps1 " (%s)") \$\[\e[m\] \[\e[1;37m\]'
export ACK_PAGER='less -FRX'

# locale
OS=$(uname)
if [ $OS == "Linux" ]; then
    export LC_ALL="en_US.utf8"
else
    export LC_ALL="en_US.UTF-8"
fi

# Use local bin before
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
if [ -d ~/bin ] ; then
    PATH=~/bin:/usr/local/share/npm/bin:"${PATH}"
fi

. ~/.configs/.bash/git-completion.bash
. ~/.configs/.bash/git-prompt.bash
. ~/.configs/.bash/git-flow-completion.bash
. ~/.configs/.bash/aliases.common.bash
. ~/.configs/.bash/aliases.git.bash
. ~/.configs/.bash/z.sh
