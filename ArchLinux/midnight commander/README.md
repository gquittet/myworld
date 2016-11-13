# Install and use Midnight commander on ArchLinux
Midnight commander is the best file manager in GNU/Linux

## Install this package

    sudo pacman -S mc

## Configuration

You can change the default skin. To see the others skins, type this command:

    ls /usr/share/mc/skins

To set a theme edit this file /~/.config/mc/ini/ and set your skin in the *[Midnight-Commander]
* section.

    [Midnight-Commander]
    skin=gotar

## MC Shortcut (thanks to [Igor Klimer](http://klimer.eu/2015/05/01/use-midnight-commander-like-a-pro/) for is great job! You're a genius!)

### Selecting file
- Ctrl - t or INSERT: Select a file to copy, edit or delete
- +: Select files based on a pattern
- \: Unselect files based on a pattern
- *: Reverse selection or if nothing is selected, select all the files.

### Accessing the shell
- Esc - Tab: Shell completion
- Ctrl - o: Put mc in background (useful to see large files)
- Ctrl - o: Return to mc
- Ctrl - RET or Alt - RET: Copy selected filenames to the shell
- Ctrl - Shift - RET: Same as above but the full path is copied

### Internal viewer and editor
