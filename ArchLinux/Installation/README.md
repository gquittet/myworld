# How to install ArchLinux

## Create an UEFI usb dongle

X is the volume ID
Y is the partition ID

### Make a Fat 32 partition with boot flag

    sudo fdisk /dev/sdX

Useful option to use:
- p : show partition
- d : delete a partition
- n : create a new partition
- t : change type (b = Fat 32)
- a : bootable flag

### Format it

    sudo mkfs.fat -F32 /dev/sdXY

### Set a label

    sudo mlabel -i /dev/sdXY ::LABEL

### Install download and install arch on it

    sudo dd bs=4M if=archlinux.iso of=/dev/sdX status=progress && sync

## Restart your computer and boot on it

### Change the layout if you don't use a QWERTY keyboard

List aviable keyboard layout:

    ls /usr/share/kbd/keymaps/**/*.map.gz

Load the layout

    loadkeys fr-pc

Verify that you've booted into UEFI mode:

    ls /sys/firmware/efi/efivars

If the directory doesn't exist is because you've booted into BIOS mode.

### Connect your computer to internet

#### Wifi

Disable the dhcpd service

    systemctl stop dhcpd

Use ***wifi-menu***

    wifi-menu

#### Ethernet

Use dhcpd

    systemctl start dhcpd

Connect the ethernet cable

#### Check the internet connection

    ping -c 3 www.google.com

### Update the system clock

    timedatectl set-ntp true

### Partitionning the disk

Use fdisk and use 2 partitions because we're lazy.

- An EFI partition : 512MB
- A big system partition : the rest of the disk
- The swap partition : 2 x RAM if you've 4GB or less of RAM. Else, use 1,5 x RAM.

Don't forget to format it with ***mkfs***

    mkfs.fat -F32 /dev/sdX1
    mkfs.ext4 /dev/sdX2
    mkswap /dev/sdX3

### Mount the partitions

    mount /dev/sdX2 /mnt
    swapon /dev/sdX3

### Select the mirrors

Uncomment the best servers (the servers that have a lower indice < 0.5)

    sed -i "s/Server/#Server/g"
    nano /etc/pacman.d/mirrorlist

### Install the system

    pacstrap /mnt base base-devel

### Generate the fstab

    genfstab -U -p /mnt >> /mnt/etc/fstab

### Chroot in the system

    arch-chroot /mnt

### Change the hostname

    echo hostname > /etc/hostname

### Set the timezone

    ln -s /usr/share/zoneinfo/Region/City /etc/localtime

### Adjust time

    hwclock --systohc

### Generate the locale

Uncomment the languages that you need in this file: ***/etc/locale.gen***

    nano /etc/locale.gen
    locale-gen


