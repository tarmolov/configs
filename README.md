Overview
=========================
There is my set of configs for bash, zsh, vim, screen and etc.

Prerequisites
=========================
  * git (>=2.0)
  * vim (>=7.3)
  * screen
  * bash or zsh
  * colordiff (for colored diff output)
  * [solarized colors](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized) (optional, for terminal)

Features
=========================
  * Tuned `PS1`/`PROMPT` looks like `<user>@<host> <working directory> (git branch) $`
  * Config for screen
  * Git completion and aliases
  * Git flow completion
  * Git config with a lot of nice shortcuts
  * Vim config based on Vundle bundles
  * Works fine on Linux and macOS
  * Supports both bash and zsh

Install
=========================
Clone the repository and execute `build.sh`:

    git clone https://github.com/tarmolov/configs.git ~/.config/tarmolov
    ~/.config/tarmolov/build.sh --name='YOUR NAME' --email=EMAIL

The script will:
- Create symlinks for `.vimrc`, `.screenrc`
- Append sourcing lines to `.bashrc` and `.zshrc`
- Install Vim plugins via Vundle
- Generate `.profile` and `.gitconfig` with your name/email

Enjoy! :)

Credits
=========================
Thx to [@aefimov](https://x.com/aefimov_box) (idea of building configs)

Thx to [@bessarabov](https://x.com/bessarabov) (idea of autoupdate configs)
