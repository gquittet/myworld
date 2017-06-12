#!/usr/bin/env bash

function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

run compton -f
run xautolock -time 99 -locker 'xtrlock'
run nm-applet

