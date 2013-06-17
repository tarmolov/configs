# Autoupdate configs
if [ $TERM = 'dumb' ]; then
    sleep 0
else
    FILE=~/.configs/.needupdate

    if ! [ -f $FILE ] || test `find $FILE -mmin +3780`; # weekly
    then
        echo "== Updating configs"
        cd ~/.configs; git pull
        git submodule update
        touch $FILE
        cd -
    fi
fi
