#!/usr/bin/env bash

function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

run compton -f
run redshift -l 50.4:3.8
run nm-applet

