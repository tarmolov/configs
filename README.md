Overview
=========================
There is my set of configs for bash, vim, screen and etc.

Features
=========================
  * Tuned *PS1* (command promt) looks like
    <user>@<host> <working directory> (git branch) $
  * Config for screen
  * Automatic Screen for SSH Login
  * Git completion
  * Git flow completion
  * Git config with a lot of nice shortcuts
  * Vim config based on bundles
  * Autoupdate configs every 8 hours (it happens only after enter to terminal)

How to install configs
=========================
Clone my repository with configs and execute build.sh:

    git clone git@github.com:tarmolov/configs.git ~/.configs
    ~/.configs./build.sh --name='YOUR NAME' --email=EMAIL

Unfortunately, you also have to change global git name and e-mail (I'll try to fix it):

    git config --global user.name 'YOUR NAME'
    git config --global user.email EMAIL

Enjoy! :)
