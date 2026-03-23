# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_DUPS

# Locale
if [[ $(uname) == "Linux" ]]; then
    export LC_ALL="en_US.utf8"
else
    export LC_ALL="en_US.UTF-8"
    # Apple Silicon Homebrew
    [ -d /opt/homebrew/bin ] && export PATH="/opt/homebrew/bin:$PATH"
fi

# Bash compatibility (needed for complete -F and similar)
autoload -Uz bashcompinit && bashcompinit

. ~/.config/tarmolov/.bash/git-prompt.bash
. ~/.config/tarmolov/.bash/aliases.common.bash
. ~/.config/tarmolov/.bash/aliases.arc.bash
. ~/.config/tarmolov/.bash/aliases.git.bash
. ~/.config/tarmolov/.bash/z.sh
. ~/.config/tarmolov/.bash/arc-prompt.bash

# Zsh completions
autoload -Uz compinit && compinit

setopt PROMPT_SUBST
export PROMPT='%F{green}%n@%m%f %~%F{green}$(__git_ps1 " (%s)")%f $ '

export TERM=xterm-256color
export LESSCHARSET=utf-8
export EDITOR=vim
export GIT_PS1_SHOWDIRTYSTATE=1
export ACK_PAGER='less -FRX'

# Use local bin before
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
if [ -d ~/bin ] ; then
    PATH=~/bin:/usr/local/share/npm/bin:"${PATH}"
fi

# Load local overrides if present
[ -f ~/.zsh/local.zsh ] && source ~/.zsh/local.zsh
