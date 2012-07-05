#!/bin/sh
# Config builder
# Copyright 2012 Alexander Tarmolov <tarmolov@gmail.com>
# TODO: --ignore submodules for git-status (git 1.7.2)
# TODO: Include for gitconfig (git 1.7.10)

# show program usage
show_usage() {
    echo "usage: ./build.sh [--clean] --name=<your name> --email=<your email> [--yandexemail=<your yandex email>]"
    echo "      --clean         removes all builded files (optional)"
    echo "      --name          your name for git and debian"
    echo "      --email         your email for git and debian"
    echo "      --yandexemail   your email at Yandex Company for git and debian (optional)"
    exit
}

# show usage if '--help' is the first argument or no argument is given
case $1 in
    ""|"--help") show_usage ;;
esac

# process command-line arguments
for OPT in "$@" ; do
    case $OPT in
        -*)  true ;
            case $OPT in
               --clean)
                    read -p "Do you want to delete .bashrc, .profile, .gitconfig, .screenrc, .vimrc and .vim? (y/n)? "
                    [ "$REPLY" != "y" ] ||
                        for file in .bashrc .profile .gitconfig .screenrc .vimrc .vim
                        do
                            rm -rf ~/$file
                        done
                    exit;;
                --name=*)
                    NAME=${OPT##*=}
                    echo $NAME
                    shift ;;
                --email=*)
                    EMAIL=${OPT##*=}
                    echo $EMAIL
                    shift ;;
                --yandexemail=*)
                    YANDEX_EMAIL=${OPT##*=}
                    shift ;;
                -*)
                    echo "Illegal option"
                ;;
            esac
        ;;
    esac
done

for file in .screenrc .vim .vimrc
do
    ln -sf ~/.configs/$file ~/$file
done

git submodule init
git submodule update
sleep 1
vim -c ":BundleInstall" -c ":qa"

# generate .profile if name and e-mail are set
if [ -n "$NAME" ] &&  [ -n "$EMAIL" ]; then
    rm -rf ~/.profile
    echo "export DEBFULLNAME=\"$NAME\"" > ~/.profile
    echo "export DEBEMAIL=$EMAIL" >> ~/.profile
    echo "export EMAIL=$EMAIL" >> ~/.profile
    echo ". ~/.configs/.profile" >> ~/.profile
    cat ~/.configs/.gitconfig | sed -e "s/@USER_NAME@/$NAME/g; s/@USER_EMAIL@/$EMAIL/g" > ~/.gitconfig
else
    ln -sf .configs/.profile ~
fi

# screen doesn't read .profile
ln -sf ~/.profile ~/.bashrc
