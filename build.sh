#!/bin/sh

# TODO: 1. Generate name and email.
# TODO: 2. --ignore submodules for git-status (git 1.7.2)
# TODO: 3. Include for gitcongig (git 1.7.10)
# TODO: 4. Create main .profile (with name and email) and include config into it.

ln -sf .configs/.profile ~
ln -sf .configs/.screenrc ~
ln -sf .configs/.vim ~
ln -sf .configs/.vimrc ~
vim -c ":BundleInstall"

#usage () {
   #echo "Usage: $0 \"<Full User Name>\" <user@mail.com>"
   #exit 1
#}

#if [ -z "$1" ]; then
   #usage
#fi
#if [ -z "$2" ]; then
   #usage
#fi

#FULL_USER_NAME=$1
#EMAIL=$2

#copy_template () {
   #cat home/$1 | sed -e "s/@FULL_USER_NAME@/$FULL_USER_NAME/g; s/@EMAIL@/$EMAIL/g" > target/$1
#}

#copy_template .gitconfig
#copy_template .profile
