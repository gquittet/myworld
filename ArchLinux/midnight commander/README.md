# Install and use Midnight commander on ArchLinux
Midnight commander is the best file manager in GNU/Linux

## Install this package

    sudo pacman -S mc

## Configuration

You can change the default skin. To see the others skins, type this command:

    ls /usr/share/mc/skins

To set a theme edit this file ***~/.config/mc/ini*** and set your skin in the ***[Midnight-Commander]*** section.

    [Midnight-Commander]
    skin=gotar

## MC Shortcut (thanks to [Igor Klimer](http://klimer.eu/2015/05/01/use-midnight-commander-like-a-pro/) for is great job! You're a genius!)

### Selecting file
- Ctrl - t or INSERT : Select a file to copy, edit or delete
- + : Select files based on a pattern
- \ : Unselect files based on a pattern
- * : Reverse selection or if nothing is selected, select all the files.

### Accessing the shell
- Esc - Tab : Shell completion
- Ctrl - o : Put mc in background (useful to see large files)
- Ctrl - o : Return to mc
- Ctrl - RET or Alt - RET : Copy selected filenames to the shell
- Ctrl - Shift - RET : Same as above but the full path is copied

### Internal viewer and editor
- Shift - F3 : Show the "raw" contents of the file
You can set the default viewer and editor by edit the PAGER and EDITOR in your ~/.bashrc

### Panels
- Alt - , : Switch panels layout (Left - Right to Bottom - Top)
- Alt - t : Swith listing mode of panel in a loop (default, long, brief, user)
- Alt - i : Synchronise the active panel with the other panel. That's show the current directory in the other panel
- Ctrl -u : Swap the panels
- Alt - o : If the selected file is a directory, load that directory on the other panel and move the selection to the next file. If the selection is not a directory, load the parent directory to the other panel and move the selection to the next file. That is useful to checking the contents of a list of directories.
- Ctrl - PagUp : Move to the parent directory
- Alt - y : Move to the previus directory in history.
- Alt - u : Move to the next directory is history.

### Searching files
- Alt - ? : Show the full search dialog
- Alt - s or Ctrl - s: Quick search mode. Start typing and the selection will move to the first matching file. Press the shortcut again to switch to the next matching file (Use wildcards "*" and "?" for easier matching).

### Common action
