# Shared environment variables — sourced by both .bashrc and .zshrc

export TERM=xterm-256color
export LESSCHARSET=utf-8
export EDITOR=vim
export GIT_PS1_SHOWDIRTYSTATE=1
export ACK_PAGER='less -FRX'

# PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
[ -d ~/bin ] && PATH=~/bin:/usr/local/share/npm/bin:"${PATH}"

# Locale + Apple Silicon Homebrew
case $(uname) in
    Linux) export LC_ALL="en_US.utf8" ;;
    *)     export LC_ALL="en_US.UTF-8"
           [ -d /opt/homebrew/bin ] && export PATH="/opt/homebrew/bin:$PATH" ;;
esac
