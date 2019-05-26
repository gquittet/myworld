# Color Emojis on ArchLinux

## Installation

Install this package:

```bash
sudo pacman -S noto-fonts-emoji
```

## Configuration

1. Create a new font configuration in `/etc/fonts/conf.d` that will be named `99-noto-fonts-emoji.conf`.

2. Put the below content into the config file:
```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>

    <alias>
        <family>sans-serif</family>
        <prefer>
            <family>Your favorite sans-serif font name</family>
            <family>Noto Color Emoji</family>
            <family>Noto Emoji</family>
        </prefer>
    </alias>

    <alias>
        <family>serif</family>
        <prefer>
            <family>Your favorite serif font name</family>
            <family>Noto Color Emoji</family>
            <family>Noto Emoji</family>
        </prefer>
    </alias>

    <alias>
        <family>monospace</family>
        <prefer>
            <family>Your favorite monospace font name</family>
            <family>Noto Color Emoji</family>
            <family>Noto Emoji</family>
        </prefer>
    </alias>

</fontconfig>
```

or use this config:

```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">

<fontconfig>

    <match>
        <test name="family"><string>sans-serif</string></test>
        <edit name="family" mode="prepend" binding="strong">
            <string>Noto Color Emoji</string>
        </edit>
    </match>

    <match>
        <test name="family"><string>serif</string></test>
        <edit name="family" mode="prepend" binding="strong">
            <string>Noto Color Emoji</string>
        </edit>
    </match>

    <match>
        <test name="family"><string>Apple Color Emoji</string></test>
        <edit name="family" mode="prepend" binding="strong">
            <string>Noto Color Emoji</string>
        </edit>
    </match>

</fontconfig>
```

I prefer the second one.

3. Enable the new configuration:
```bash
sudo ln -s /etc/fonts/conf.avail/99-noto-emoji-color.conf /etc/fonts/conf.d/99-noto-emoji-color.conf
```

4. Reload the fonts cache:
```bash
fc-cache -fv
```

5. Log out and Log in (reboot also works)

## Verification

You can check if the configuration is correct with this website:  
[https://eosrei.github.io/emojione-color-font/full-demo.html](https://eosrei.github.io/emojione-color-font/full-demo.html)
