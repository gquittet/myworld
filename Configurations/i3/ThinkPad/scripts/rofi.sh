#!/bin/bash

case $1 in
    "-d") showAction="drun"
        ;;
    "-w") showAction="window"
        ;;
    *) exit
        ;; 
esac

rofi -modi "drun,window" \
    -show $showAction \
    -font "Fira Mono 14" \
    -lines 7 \
    -separator-style none \
    -location 1 \
    -width 100 \
    -line-padding 2 \
    -color-window "#222222, #222222, #b1b4b3" \
    -color-normal "#222222, #b1b4b3, #222222, #005577, #b1b4b3" \
    -color-active "#222222, #b1b4b3, #222222, #007763, #b1b4b3" \
    -color-urgent "#222222, #b1b4b3, #222222, #77003d, #b1b4b3"
