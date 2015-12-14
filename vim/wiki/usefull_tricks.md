# Useful tricks for VIM

## Using folds

> Why I have to use folds ?

*Because folds is very useful. They can hide some functions in your code.*

**Here is the key cheatsheet:**

    zf#j creates a fold from the cursor down # lines.
    zf/string creates a fold from the cursor to string .
    zc close the current fold
    zj moves the cursor to the next fold.
    zk moves the cursor to the previous fold.
    zo opens a fold at the cursor.
    zO opens all folds at the cursor.
    zm increases the foldlevel by one.
    zM closes all open folds.
    zr decreases the foldlevel by one.
    zR decreases the foldlevel to zero -- all folds will be open.
    zd deletes the fold at the cursor.
    zE deletes all folds.
    [z move to start of open fold.
    ]z move to end of open fold.
