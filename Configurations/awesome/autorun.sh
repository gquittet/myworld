#!/usr/bin/env bash

function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

run xautolock -time 99 -locker 'xtrlock'
run compton -f
run redshift -l 50.4:3.8

