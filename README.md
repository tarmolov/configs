# dotfiles

Personal configs for vim, git, bash/zsh, and screen.

## Prerequisites

- `git` ≥ 2.0
- `vim` ≥ 8.0
- `bash` or `zsh`
- `screen`
- `colordiff` — for colored diff output
- [Solarized for iTerm2](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized) _(optional)_

## Install

```bash
git clone https://github.com/tarmolov/configs.git ~/.config/tarmolov
~/.config/tarmolov/build.sh --name='Your Name' --email=you@example.com
```

The script creates symlinks for `.vimrc` and `.screenrc`, appends sourcing lines to `.bashrc`/`.zshrc`, generates `.gitconfig` and `.profile`, and installs vim plugins via [vim-plug](https://github.com/junegunn/vim-plug).

Then open vim and run `:PlugInstall`.

## Update

```bash
~/.config/tarmolov/update.sh
```

## What's inside

**Vim** — vim-plug, async linting with [ALE](https://github.com/dense-analysis/ale), NERDTree, vim-go, polyglot syntax, solarized8 colorscheme

**Git** — aliases, shortcuts, completion, git-flow completion

**Shell** — tuned `PS1`/`PROMPT` with git branch, common aliases, works on Linux and macOS

## Credits

[@aefimov](https://x.com/aefimov_box) — idea of building configs  
[@bessarabov](https://x.com/bessarabov) — idea of autoupdate configs
