# How to install and run VMWare on ArchLinux

## First, you need to install these packages

    sudo pacman -S fuse gtkmm linux-headers

## Now, download the latest pro installer

Go to the official website and download the trial version of VMWare Workstation for Linux.

## Run the bundle as root

    sudo sh VMware-edition-version.release.architecture.bundle

During the installation, enter the key. For the path where the services and modules are stored, type:

    /etc/init.d

A warning spawn! But, be cool :) This is normal. It's because Arch uses now Systemd.

## If you need to rebuild the modules from terminal later use

    sudo vmware-modconfig --console --install-all

# VMWare usage

### Before using workstation check if the modules are started

    sudo /etc/init.d/vmware status

### If the modules aren't started, type this command

    sudo /etc/init.d/vmware start

### To kill them

    sudo /etc/init.d/vmware stop

### And finally to restart them

    sudo /etc/init.d/vmware restart

