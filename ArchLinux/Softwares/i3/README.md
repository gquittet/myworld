# Install my i3 configuration on ArchLinux

## First you need these packages

    sudo pacman -S i3 compton rofi scrot 
lxappearance feh acpi bc sysstat dmenu

## Install these with yaourt

    yaourt font-awesome
    yaourt i3blocks
    yaourt playerctl

## Before configure it

Write into your .xinitrc file:

    exec i3

If you want to change your keyboard type before ***exec i3***:

    setxkbmap -layout us -variant alt-intl -option nodeadkey

I have an QWERTY keyboard. I'm Belgian so I need the alternative international
and I don't want the dead keys.

If you want to change your screen resolution type before ***exec i3***:

    xrandr -s 1600x900

To know the resolution that is supported by your monitor type in a terminal:

    xrandr -q


## Configure it

Copy my i3 and i3blocks configuration to 
***~/.config/i3/***. If this folder don't 
exist, make it.

## Edit it

Edit my configuration. The file is 
here: ***~/.config/i3/config***. Change the 
screen 
resolution, the fonts, the wallpaper, the 
keyboard layout, the startup programs, etc. 
