# How to get better font rendering on ArchLinux

## Make symbolic links as root

```
ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d
ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
```

Check if the file `10-hinting-slight.conf` exists in `/etc/fonts/conf.d`

If the file doesn't exist, make a symbolic link as root

```
ln -s /etc/fonts/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d
```

## Edit `/etc/profile.d/jre.sh`

Add these lines at the end

```
# https://wiki.archlinux.org/index.php/java#Better_font_rendering
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
```

## Edit `/etc/profile.d/freetype2.sh`

Uncoment this line and set it to 40

```
export FREETYPE_PROPERTIES="truetype:interpreter-version=40"
```

## Update font cache as root

```
gdk-pixbuf-query-loaders --update-cache
```
