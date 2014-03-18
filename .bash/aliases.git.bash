# git aliases (based on TJ Holowaychuk's aliases)

alias gs="git st"
alias gd="git di"
alias gdc="git dic"
alias ga="git add"
alias gsh="git show"
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gf="git app"
alias gfa="git app -a"
alias gp="git pull"
alias gb="git branch"
alias gbd="git branch -D"
alias gba="git branch -a"
alias gcob="git checkout -b"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias glg="git lg"
alias gh="git hist"
alias gr='cd "`git rev-parse --show-toplevel`"'
alias gv="git vommit"

complete -F _git_diff gd
complete -F _git_diff gdc
complete -F _git_pull gp
complete -F _git_branch gb
complete -F _git_branch gbd
complete -F _git_checkout gcob
complete -F _git_checkout gco
complete -F _git_cherry-pick gcp
complete -F _git_log glg
complete -F _git_log gh
