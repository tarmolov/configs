# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS

# Zsh completions (must come before bashcompinit)
autoload -Uz compinit && compinit

# Bash compatibility (needed for complete -F and similar)
autoload -Uz bashcompinit && bashcompinit

. ~/.config/tarmolov/.bash/git-prompt.bash
. ~/.config/tarmolov/.bash/aliases.common.bash
. ~/.config/tarmolov/.bash/aliases.arc.bash
. ~/.config/tarmolov/.bash/aliases.git.bash
. ~/.config/tarmolov/.bash/z.sh
. ~/.config/tarmolov/.bash/arc-prompt.bash

setopt PROMPT_SUBST
export PROMPT='%F{green}%n@%m%f %~%F{green}$(__git_ps1 " (%s)")%f $ '

. ~/.config/tarmolov/.bash/env.bash

# Load local overrides if present
[ -f ~/.zsh/local.zsh ] && source ~/.zsh/local.zsh
