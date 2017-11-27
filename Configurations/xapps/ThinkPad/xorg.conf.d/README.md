# Libinput

## To configure libinput with xorg

1. Copy the ***40-libinput.conf*** file which is inside the ***/usr/share/X11/xorg.conf.d/*** folder to ***/etc/X11/xorg.conf.d/***.

2. Configure the keyboard with these options

```
Option "XkbLayout" "us"
Option "XkbVariant" "intl"
Option "XkbOptions" "caps:swapescape, terminate:ctrl_alt_bksp"

```

3. Configure the touchpad with this options

```
Option "AccelSpeed" "1"
Option "DisableWhileTyping" "false"
Option "HorizontalScrolling" "true"
Option "MiddleEmulation " "false"
Option "NaturalScrolling" "true"
Option "ScrollMethod" "twofinger"
Option "Tapping" "true"
Option "TappingDrag" "true"
Option "TappingDragLock" "false"
```

To get some documentation, you can use this command: **man libinput.4**

