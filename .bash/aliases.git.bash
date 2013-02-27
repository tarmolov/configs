# git aliases (based on TJ Holowaychuk's aliases)

alias gs="git st"
alias gd="git di"
cmpf _git_diff gd
alias gdc="git dic"
cmpf _git_diff gdc
alias ga="git add"
alias gsh="git show"
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gf="git app"
alias gfa="git app -a"
alias gp="git pull"
cmpf _git_pull gp
alias gb="git branch"
cmpf _git_branch gb
alias gbd="git branch -D"
cmpf _git_branch gbd
alias gba="git branch -a"
alias gcob="git checkout -b"
cmpf _git_checkout gcob
alias gco="git checkout"
cmpf _git_checkout gco
alias gcp="git cherry-pick"
cmpf _git_cherry-pick gcp
alias glg="git lg"
cmpf _git_log glg
alias gh="git hist"
cmpf _git_log gh
alias gr='cd "`git rev-parse --show-toplevel`"'
alias gv="git vommit"
