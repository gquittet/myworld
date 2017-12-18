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

Use fdisk and use 4 partitions. Here is my partitions table.

| Mount point | Partition | Partition type       | Bootable flag | Suggested size          |
|-------------|-----------|----------------------|---------------|-------------------------|
| /boot       | /dev/sdx1 | EFI System Partition | Yes           | 4Go                     |
| /           | /dev/sdx2 | Linux                | No            | 50Go                    |
| [SWAP]      | /dev/sdx3 | Linux swap           | No            | 16Go                    |
| /home       | /dev/sdx4 | Linux                | No            | Remainder of the device |

- Root:
    - With 50Go, I have a lot of space because I've got many programs to install. You can use 20Go $-$ 30Go.

- SWAP:
    - If the device has < 8Go of RAM, I'll do RAM quantity * 2
    - If the device has >= 8Go of RAM < 12Go, I'll do RAM quantity * 1.5
    - If the device has >= 12Go of RAM, I'll do RAM quantity * 1

- HOME:
    - With an HDD: The remainder of the device.
    - With an SSD: The remainder of the device - over-provisioning

Over-provisioning is an empty space that maximize the lifetime and performance of an SSD.

- Over-provisioning quantity:
    - PRO SSD: 28%
    - Classic SSD: 6.7%

[Source: Samsung documentation](http://www.samsung.com/semiconductor/minisite/ssd/downloads/document/Samsung_SSD_845DC_04_Over-provisioning.pdf)

Don't forget to format it with ***mkfs***

    mkfs.fat -F32 /dev/sdX1
    mkfs.ext4 /dev/sdX2
    mkswap /dev/sdX3
    mkfs.ext4 /dev/sdX4

### Mount the partitions

    mount /dev/sdX2 /mnt
    swapon /dev/sdX3

### Select the mirrors

Uncomment the best servers (the servers that have a lower indice < 0.5)

    sed -i "s/Server/#Server/g"
    nano /etc/pacman.d/mirrorlist

### Install the system

    pacstrap /mnt base base-devel dialog wireless_tools wireless_supplicant

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

### Set the LANG variable in /etc/locale.conf

    LANG=en_US.UTF-8

### Set the keyboard layout in /etc/vconsole.conf

    KEYMAP=de-latin1

### Set the hostname

    echo mycustomhostname > /etc/hostname


### Install these package

    pacman -S sudo bash-completion

### Set root password

    passwd

### Add user and set the user passwd

    useradd -m -g users -G wheel,storage,power -s /bin/bash gquittet
    passwd gquittet

### Compile the kernel

    mkinitcpio -p linux

### Install grub needed tools

    pacman -S grub
    grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub --recheck
    grub-mkconfig -o /boot/grub/grub.conf

### Umount all

    umount -R /mnt

