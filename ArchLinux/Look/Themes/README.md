# My themes for ArchLinux

To install theme,

## Install theses packages

    sudo pacman -S lxappearance

## GTK and WM

    arc-gtk-theme

## Icon theme

    arc-icon-theme

## Cursor theme

    elementary

## Configure them with

- lxappearance
- qtconfig-qt4

## Configure them with

- lxappearance
- qtconfig-qt4

## How to fix break icons on lxappearance

You need to reinstall `librsvg` and update it with this command:

```
sudo pacman -S librsvg
sudo /usr/bin/gdk-pixbuf-query-loaders --update-cache
```
