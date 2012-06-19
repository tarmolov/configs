#!/bin/sh

# TODO: --ignore submodules for git-status (git 1.7.2)
# TODO: Include for gitcongig (git 1.7.10)
# TODO: autoupdate config every day/week/month

ln -sf .configs/.screenrc ~
ln -sf .configs/.vim ~
ln -sf .configs/.vimrc ~
vim -c ":BundleInstall" -c ":qa"

# generate .profile if name and e-mail are set
if [ -n "$1" ] &&  [ -n "$2" ]; then
    rm -rf ~/.profile
    echo "export DEBFULLNAME=\"$1\"\nexport DEBEMAIL=$2\nexport EMAIL=$2\n. ~/.configs/.profile" > ~/.profile
else
    ln -sf .configs/.profile ~
fi

# screen doesn't read .profile
ln -sf ~/.profile ~/.bashrc
