#!/bin/bash

__arc_ps1 () {
    local exit=$?

    if [[ $PWD =~ "/arc/" ]]; then
        printf -- " (%s)" `cat $HOME/arc/store/.arc/HEAD | awk -F '"' '{print $2}'`
    fi
    return $exit
}
