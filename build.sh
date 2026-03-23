#!/usr/bin/env bash
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
    for file in .profile .gitconfig .screenrc .vimrc .vim
    do
        rm -rf ~/$file
    done
    # .bashrc and .zshrc may contain user-specific data; only remove the sourcing line.
    # IMPORTANT: if ~/.bashrc or ~/.zshrc is a symlink (e.g. from a previous install),
    # do NOT edit it — that would corrupt the repo file it points to. Skip it.
    for rcfile in .bashrc .zshrc; do
        if [ -L ~/$rcfile ]; then
            # It's a symlink — remove it entirely, a fresh one will be appended below
            rm -f ~/$rcfile
        elif [ -f ~/$rcfile ]; then
            # Regular file — safely strip the sourcing line
            tmpfile=$(mktemp)
            grep -v '\.config/tarmolov' ~/$rcfile > "$tmpfile" || true || true
            mv "$tmpfile" ~/$rcfile
        fi
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
                    ;;
                --email=*)
                    EMAIL=${OPT##*=}
                    ;;
                -*)
                    echo "Illegal option"
                ;;
            esac
        ;;
    esac
done

echo "Config setup is started..."
echo

read -r -p "Config builder wants to delete .profile, .gitconfig, .screenrc, .vimrc and .vim (and remove tarmolov lines from .bashrc/.zshrc). Do you want to continue? (y/n)? " REPLY
[ "$REPLY" != "y" ] && exit

echo "Clean old config files..."
clean

for file in .screenrc .vimrc
do
    echo "Set link to $file"
    ln -sf ~/.config/tarmolov/$file ~/$file
done
# .vim is a directory; create it if needed and link bundle inside
echo "Set link to .vim/bundle"
mkdir -p ~/.config/tarmolov/.vim/bundle
mkdir -p ~/.vim
ln -sfn ~/.config/tarmolov/.vim/bundle ~/.vim/bundle

echo "Set up .bashrc (wrapper sourcing tarmolov config)"
if [ ! -f ~/.bashrc ] || ! grep -q 'tarmolov' ~/.bashrc; then
    echo ". ~/.config/tarmolov/.bashrc" >> ~/.bashrc
fi

echo "Set up .zshrc (wrapper sourcing tarmolov config)"
if [ ! -f ~/.zshrc ] || ! grep -q 'tarmolov' ~/.zshrc; then
    echo ". ~/.config/tarmolov/.zshrc" >> ~/.zshrc
fi

echo "Install vim plugins..."
cd ~/.config/tarmolov
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    echo "Vundle already installed, skipping clone."
fi
sleep 1
vim -c ":PluginInstall" -c ":qa"
cd - > /dev/null 2>&1

echo "Generate .profile and .gitconfig"

# generate .profile if name and e-mail are set
if [ -n "$NAME" ] && [ -n "$EMAIL" ]; then
    grep -qF "DEBFULLNAME" ~/.profile 2>/dev/null || echo "export DEBFULLNAME=\"$NAME\"" >> ~/.profile
    grep -qF "DEBEMAIL" ~/.profile 2>/dev/null || echo "export DEBEMAIL=$EMAIL" >> ~/.profile
    grep -qF "export EMAIL" ~/.profile 2>/dev/null || echo "export EMAIL=$EMAIL" >> ~/.profile

    grep -qF "[user]" ~/.gitconfig 2>/dev/null || {
        echo "[user]" >> ~/.gitconfig
        echo "  name = $NAME" >> ~/.gitconfig
        echo "  email = $EMAIL" >> ~/.gitconfig
    }
fi

grep -qF ".config/tarmolov/.profile" ~/.profile 2>/dev/null || echo ". ~/.config/tarmolov/.profile" >> ~/.profile
grep -qF ".config/tarmolov/.gitconfig" ~/.gitconfig 2>/dev/null || {
    echo "[include]" >> ~/.gitconfig
    echo "  path = .config/tarmolov/.gitconfig" >> ~/.gitconfig
}

echo "Add useful commands"
mkdir -p ~/bin
mkdir -p ~/.screen-logs
ln -sf ~/.config/tarmolov/.bin/diffconflicts ~/bin
# Remove git-vommit if present (deleted from repo)
rm -f ~/bin/git-vommit

echo
echo "Config setup is finished..."
