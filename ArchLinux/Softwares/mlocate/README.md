# MLocate: A usefull tool for finding files

## Install these package

    sudo pacman -S mlocate

## After that, update the database
MLocate works with a database that contains all the files in ArchLinux.
Before looking for a file, you need to update the database.
The database can be updated only with the root account.

    sudo updatedb

## Find a file

    locate file

