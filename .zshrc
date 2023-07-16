. ~/.config/tarmolov/.bash/git-prompt.bash
. ~/.config/tarmolov/.bash/aliases.common.bash
. ~/.config/tarmolov/.bash/aliases.arc.bash
. ~/.config/tarmolov/.bash/aliases.git.bash
. ~/.config/tarmolov/.bash/z.sh
. ~/.config/tarmolov/.bash/arc-prompt.bash

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on %b'

setopt PROMPT_SUBST
export PROMPT='%F{green}%n@%m%f %~%F{green}$(__git_ps1 " (%s)")%f $ '

export TERM=linux
export LESSCHARSET=utf-8
export EDITOR=vim
export GIT_PS1_SHOWDIRTYSTATE=1
export ACK_PAGER='less -FRX'

# Use local bin before
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
if [ -d ~/bin ] ; then
    PATH=~/bin:/usr/local/share/npm/bin:"${PATH}"
fi
