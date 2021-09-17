#!/bin/bash

__arc_ps1 () {
    local exit=$?

    if [[ $PWD =~ "/arcadia/" ]]; then
        printf -- " (%s)" `cat $HOME/.store/.arc/HEAD | awk -F '"' '{print $2}'`
    fi
    return $exit
}
