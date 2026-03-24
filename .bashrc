#!/usr/bin/env bash

. ~/.config/tarmolov/.bash/git-completion.bash
. ~/.config/tarmolov/.bash/git-prompt.bash
. ~/.config/tarmolov/.bash/git-flow-completion.bash
. ~/.config/tarmolov/.bash/aliases.common.bash
. ~/.config/tarmolov/.bash/aliases.arc.bash
. ~/.config/tarmolov/.bash/aliases.git.bash
. ~/.config/tarmolov/.bash/z.sh
. ~/.config/tarmolov/.bash/arc-prompt.bash

export PS1='\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\]\[\e[1;32m\]$(__arc_ps1)$(__git_ps1 " (%s)") \$\[\e[m\] \[\e[1;37m\]'

. ~/.config/tarmolov/.bash/env.bash

# Load local overrides if present
[ -f ~/.bash/local.bash ] && source ~/.bash/local.bash
