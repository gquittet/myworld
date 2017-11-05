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
    -dpi 144 \
    -font "Fira Mono 12" \
    -hide-scrollbar \
    -location 0 \
    -fullscreen \
    -lines 7 \
    -padding 340 \
    -sidebar-mode \
    -color-window "argb:ee282a36, argb:ee282a36" \
    -color-normal "argb:ee282a36, #e6e6e6, argb:ee282a36, argb:eebd93f9, #f8f8f2" \
    -color-active "argb:ee282a36, #e6e6e6, argb:ee282a36, argb:eebd93f9, #f8f8f2" \
    -color-urgent "argb:ee282a36, #bd93f9, argb:ee282a36, argb:ee77003d, #bd93f9"
