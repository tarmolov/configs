#!/bin/sh

# TODO: 2. --ignore submodules for git-status (git 1.7.2)
# TODO: 3. Include for gitcongig (git 1.7.10)
# TODO: autoupdate config every day/week/month

ln -sf .configs/.screenrc ~
ln -sf .configs/.vim ~
ln -sf .configs/.vimrc ~
vim -c ":BundleInstall" -c ":qa"

if [ -n "$1" ] &&  [ -n "$2" ]; then
    rm -rf ~/.profile
    echo "export DEBFULLNAME=\"$1\"\nexport DEBEMAIL=$2\nexport EMAIL=$2\n. ~/.configs/.profile" > ~/.profile
else
    ln -sf .configs/.profile ~
fi
