# My themes for ArchLinux

## TTY

### Increase font size

Install the ***terminus-font*** package and then, edit the ***/etc/vconsole.conf*** file.

Add this:

```
FONT=ter-122n
```

## Grub2

## Change resolution

Edit the ***/etc/default/grub*** and edit these lines to look like this:

```bash
GRUB_GFXMODE=1368x768x32,1024x768x32,auto

# Uncomment to allow the kernel use the same resolution used by grub
GRUB_GFXPAYLOAD_LINUX=keep
```

GRUB_GFXMODE=\<desired resolution\>,\<fallback resolution\>,auto

## GUI

To install theme,

## Install theses packages

    sudo pacman -S lxappearance

## GTK and WM

    arc-gtk-theme

## Icon theme

    papirus-icon-theme

## Cursor theme

    elementary

## Configure them with

- lxappearance

## How to fix break icons on lxappearance

You need to reinstall `librsvg` and update it with this command:

```
sudo pacman -S librsvg
sudo /usr/bin/gdk-pixbuf-query-loaders --update-cache
```
