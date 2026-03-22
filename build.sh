#!/bin/sh
set -e

# Config builder
# Copyright 2012 Alexander Tarmolov <tarmolov@gmail.com>

# show program usage
show_usage() {
    echo "usage: ./build.sh [--clean] --name=<your name> --email=<your email>"
    echo "      --clean         removes all builded files (optional)"
    echo "      --name          your name for git and debian"
    echo "      --email         your email for git and debian"
    exit
}

# check required dependencies
check_deps() {
    for cmd in git vim; do
        if ! command -v "$cmd" > /dev/null 2>&1; then
            echo "Error: '$cmd' is required but not installed."
            exit 1
        fi
    done
}

# clean config files
clean() {
    for file in .bashrc .zshrc .profile .gitconfig .screenrc .vimrc .vim
    do
        rm -rf ~/$file
    done
}

check_deps

# process command-line arguments
for OPT in "$@" ; do
    case $OPT in
        -*)  true ;
            case $OPT in
               --help)
                    show_usage;;
                --clean)
                    clean
                    echo "Config files removed."
                    exit 0 ;;
                --name=*)
                    NAME=${OPT##*=}
                    shift ;;
                --email=*)
                    EMAIL=${OPT##*=}
                    shift ;;
                -*)
                    echo "Illegal option"
                ;;
            esac
        ;;
    esac
done

echo "Config setup is started..."
echo

read -p "Config builder wants to delete .bashrc, .zshrc, .profile, .gitconfig, .screenrc, .vimrc and .vim. Do you want to continue? (y/n)? "
[ "$REPLY" != "y" ] && exit

echo "Clean old config files..."
clean

for file in .screenrc .vim .vimrc
do
    echo "Set link to $file"
    ln -sf ~/.config/tarmolov/$file ~/$file
done

echo "Set link to .bashrc"
ln -sf ~/.config/tarmolov/.bashrc ~/.bashrc

echo "Set link to .zshrc"
ln -sf ~/.config/tarmolov/.zshrc ~/.zshrc

echo "Install vim plugins..."
cd ~/.config/tarmolov
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sleep 1
vim -c ":PluginInstall" -c ":qa"
cd - >> /dev/null

echo "Generate .profile and .gitconfig"

# generate .profile if name and e-mail are set
if [ -n "$NAME" ] &&  [ -n "$EMAIL" ]; then
    echo "export DEBFULLNAME=\"$NAME\"" >> ~/.profile
    echo "export DEBEMAIL=$EMAIL" >> ~/.profile
    echo "export EMAIL=$EMAIL" >> ~/.profile

    echo "[user]" >> ~/.gitconfig
    echo "  name = $NAME" >> ~/.gitconfig
    echo "  email = $EMAIL" >> ~/.gitconfig
fi

echo ". ~/.config/tarmolov/.profile" >> ~/.profile
echo "[include]" >> ~/.gitconfig
echo "  path = .config/tarmolov/.gitconfig" >> ~/.gitconfig

echo "Add useful commands"
mkdir -p ~/bin
ln -sf ~/.config/tarmolov/.bin/diffconflicts ~/bin

echo
echo "Config setup is finished..."
