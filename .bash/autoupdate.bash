# Autoupdate configs
if [ $TERM = 'dumb' ]; then
    sleep 0
else
    FILE=~/.configs/.needupdate

    if ! [ -f $FILE ] || test `find $FILE -mmin +3780`; # weekly
    then
        if ping -q -W 1 -c 1 ya.ru > /dev/null; then
            echo "== Updating configs"
            cd ~/.configs; git pull
            git submodule update
            touch $FILE
            cd -
        fi
    fi
fi
