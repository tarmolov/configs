Overview
=========================
There is my set of configs for bash, vim, screen and etc.

Prerequisites
=========================
  * git (>=1.7.10)
  * vim (>=7.3)
  * screen

Features
=========================
  * Tuned `PS1` (command promt) looks like `<user>@<host> <working directory> (git branch) $`
  * Config for screen
  * Automatic Screen for SSH Login
  * Git completion
  * Git flow completion
  * Git extra commands
  * Git config with a lot of nice shortcuts
  * Vim config based on bundles
  * Autoupdate configs every 8 hours (it happens only after enter to terminal)
  * Works fine on unix and osx

Install
=========================
Clone my repository with configs and execute build.sh:

    git clone git://github.com/tarmolov/configs.git ~/.configs
    ~/.configs/./build.sh --name='YOUR NAME' --email=EMAIL

Enjoy! :)

Credits
=========================
Thx to [@aefimov](https://twitter.com/#!/aefimov_box) (idea of building configs)

Thx to [@bessarabov](https://twitter.com/#!/bessarabov) (idea of autoupdate configs)
