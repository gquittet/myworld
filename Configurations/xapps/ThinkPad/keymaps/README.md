# Keymap

I've copy the builtin `us-acentos` keymap to swap the CapsLock and Escape key.

## To configure console TTY Keymap

1. Copy the ***us-acentos-vim.map.gz*** file in `/usr/share/kbd/keymaps/i386/qwerty`
2. Edit `/etc/vconsole.conf` and put this content into it:

```
KEYMAP=us-acentos-vim
```
