# Install ArchLinux on ThinkPad 13 2nd generation

We use a LUKS on LVM for better security. I don't use a key file because the file is stored in the linuz.img file. So, if your boot partition stay uncrypted, a hacker can decompress your boot image and get your key file to uncrypt all your data.  
**Best solution**: Use a master password and never share it.

## Prerequis

[https://wiki.archlinux.org/index.php/installation_guide#Pre-installation](https://wiki.archlinux.org/index.php/installation_guide#Pre-installation)

### Switch keyboard

#### List all layout available

```
ls /usr/share/kbd/keymaps/**/*.map.gz
```

#### Apply new layout

```
loadkeys us-acentos
```

### Check the boot mode

If ***UEFI*** mode is enabled on an UEFI motherboard, Archiso will boot Arch Linux accordingly via systemd-boot. To verify this, list the efivars directory:

```
ls /sys/firmware/efi/efivars
```

### Connect to internet

#### Wifi

```
wifi-menu
```

#### Wired

```
dhcpcd
```

#### Check your network connection

```
ping archlinux.org
```

### Update system-clock

```
timedatectl set-ntp true
```

## Partition the disks

Find your disk

```
fdisk -l
```

Apply this schema for an SSD (use gdisk):

|Name|Size|Type|
|---|---|---|
|boot EFI|2048M|EF00|
|LVM space|93% - 2048M|8e00|
|OP|7%|/|

*Note: The over-provisioning is needed to increase your SSD lifetime and performace.*

## Encypt the LVM space

[https://wiki.archlinux.org/index.php/Dm-crypt/Device_encryption#Cryptsetup_usage](https://wiki.archlinux.org/index.php/Dm-crypt/Device_encryption#Cryptsetup_usage)

```
cryptsetup -v --type luks2 -s 512 -h sha512 -i 5000 --use-random -y luksFormat /dev/lvmSpace
```

## Open the encrypted space

```
cryptsetup open --type luks2 /dev/lvmSpace cryptroot
```

## Create LVM

[https://wiki.archlinux.org/index.php/LVM](https://wiki.archlinux.org/index.php/LVM)

### Create physical volume

```
pvcreate --dataalignment 1m /dev/mapper/cryptroot
```

*Note: --dataalignment is only needed for an **SSD***

### Create volume group

```
vgcreate vg0 /dev/mapper/cryptroot
```

### Create logical volumes

1. Root (/)

```
lvcreate -L 100G vg0 -n lvroot
```

2. Home (/home)

```
lvcreate -l 100%FREE vg0 -n lvhome
```

### Apply changes

```
vgscan
vgchange -ay
```

### Format the partitions

1. Boot (/boot)

```
mkfs.fat -F32 /dev/bootPartition
fatlabel /dev/bootPartition BOOT
```

2. Root (/)

```
mkfs.xfs -L ROOT /dev/vg0/lvroot
```

3. Home (/home)

```
mkfs.xfs -L HOME /dev/vg0/lvhome
```

## Select the good mirrors

1. Comment all the servers

```
sed -i "s/Server/#Server/" /etc/pacman.d/mirrorlist
```

2. Edit the mirrorlist and uncomment the nearest

```
vim /etc/pacman.d/mirrorlist
```

## Mount the partitions

```
mount /dev/vg0/lvroot /mnt
mkdir /mnt/{boot,home}
mount /dev/bootPartition /mnt/boot
mount /dev/vg0/lvhome /mnt/home
```

## Install the base of your system

```
pacstrap /mnt base base-devel pacman-contrib vim mtools dosfstools lsb-release ntfs-3g exfat-utils bash-completion zip unzip p7zip
```

## Chroot in your new fresh system

```
arch-chroot /mnt
```

## Pre-configuration

### Timezone

```
ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime 
```

### Hardware clock

Don't do this step if you have Windows installed on your system.
```
hwclock --systohc --utc
```

### Locale generation

1. Uncomment lines that you want in this file: `/etc/locale.gen`
2. Run this command to generate the languages: `locale-gen`
3. Edit the locale file: `vim /etc/locale.conf`
4. Append this line: `LANG=en_US.UTF-8` (where en_US.UTF-8 is the language that you want).
5. 

### Hostname

```
echo "myHostname" > /etc/hostname
vim /etc/hosts
```

And add the following content:

```
127.0.0.1	localhost
::1		    localhost
127.0.0.1	void.localdomain	void
::1	    	void.localdomain	void
```

### Mkinitcpio

1. Edit the file `/etc/mkinitcpio.conf`
2. Change the **MODULES** line like this
```
MODULES=(intel_agp i915)
```

3. Change the **HOOKS** line like this
```
HOOKS=(base udev autodetect modconf block lvm2 encrypt filesystems keyboard fsck shutdown)
```

or

```
HOOKS=(base udev autodetect keyboard keymap consolefont modconf block lvm2 encrypt filesystems fsck shutdown)
```
*Note1: shutdown is needed because I've a bug on shutdown with 'Failed to unmount /oldroot'*  
*Note2: lvm2 and ecnrypt are needed for encrypted files system*

4. Run the mkinitcpio
```
mkinitcpio -p linux
```

### Graphics drivers

[https://wiki.archlinux.org/index.php/Intel_graphics](https://wiki.archlinux.org/index.php/Intel_graphics)

1. Install these packages
```
pacman -S intel-ucode mesa vulkan-intel
```

2. Don't install this package: `xf86-video-intel`.  
It's to old.

3. Edit this file: `/etc/modprobe.d/i915.conf`
```
options i915 enable_dc=1 enable_fbc=1 enable_guc=2 fastboot=1 modeset=1
```
*Note1: A list of all options along with short descriptions and default values can be generated with the following command: `modinfo -p i915`*  
*Note2: To check which options are currently enabled: `systool -m i915 -av`*

### Hardware acceleration

[https://wiki.archlinux.org/index.php/Hardware_video_acceleration](https://wiki.archlinux.org/index.php/Hardware_video_acceleration)

1. Install these packages
```
sudo pacman -S libva-intel-driver libva-vdpau-driver
```

2. Add this line to the `/etc/environment`
```
LIBVA_DRIVER_NAME=i965
```

### Root password

```
passwd
```

```
ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime 
hwclock --systohc
vim /etc/locale.gen 
locale-gen
vim /etc/locale.conf
vim /etc/vconsole.conf
vim /etc/hostname
vim /etc/hosts
vim /etc/mkinitcpio.conf 
pacman -S intel-ucode
vim /etc/mkinitcpio.conf 
passwd
mkinitcpio -p linux
pacman -Syy networkmanager
pacman -Syy python python2
systemctl enable NetworkManager
pacman -S ntp
vim /etc/ntp.conf 
systemctl enable ntpd.service 
pacman -S zsh zsh-completions 
useradd -m -g users -G wheel,input -c 'Guillaume Quittet' -s /bin/bash gquittet
passwd gquittet
visudo
vim /etc/pacman.conf 
pacman -Syy
vim /etc/systemd/journald.conf 
bootctl --path=/boot install
man bootctl
mkdir /etc/pacman.d/hooks
vim /etc/pacman.d/hooks/100-systemd-boot.hook
vim /boot/loader/loader.conf 
vim /boot/loader/entries/arch.conf
pacman -S tlp powertop acpi_call
pacman -S tlp powertop acpi_call x86_energy_perf_policy  ethtool
pacman -S xorg-server xorg-xapps 
pacman -S xorg-server xorg-apps 
pacman -Ss xf86-video
pacman -S xorg-drivers
pacman -S mesa
pacman -S libinput 
pacman -S lightdm lightdm-gtk-greeter
pacman -S deepin deepin-extra
vim /etc/lightdm/lightdm.conf 
pacman -S bluez bluez-utils 
systemctl enable bluetooth.service 
vim /etc/bluetooth/main.conf 
gpasswd -a gquittet audio 
pacman -S alsa-utils 
systemctl status alsa-restore.service 
exit
systemctl status alsa-restore.service 
systemctl enable alsa-restore.service 
systemctl enable alsa-status.service 
pacman -S pulseaudio pulseaudio-{alsa,bluetooth,equalizer,jack,lirc,zeroconf}
exit
pacman -S pulseaudio pulseaudio-{alsa,bluetooth,equalizer,jack,lirc,zeroconf} pavucontrol gstreamer gst-{libav,plugins-{bad,base,good,ugly}}
pacman -S pulseaudio pulseaudio-{alsa,bluetooth,equalizer,jack,lirc,zeroconf} pavucontrol gstreamer gst-{libav,plugins-{bad,base,good,ugly}} gstreamer-vaapi
vim /etc/modprobe.d/i915.conf
pacman -S libva-intel-driver libva-vdpau-driver
pacman -S libva-intel-driver libva-vdpau-driver libva-utils
pacman -Ss ttf-
pacman -Ss ttf-{ubuntu-font-family,dejavu,ionicons,opensans,roboto,liberation,freefont,bitstream-vera} freetype2
pacman -S ttf-{ubuntu-font-family,dejavu,ionicons,opensans,roboto,liberation,freefont,bitstream-vera} freetype2
pacman -S firefox firefox-i18n-fr 
pacman -S libreoffice-still-fr aspell hunspell hunspell-en_US hunspell-fr aspell-fr aspell-en
pacman -S git
pacman -S seahorse seahorse-nautilus
pacman -S gnome-calendar
pacman -S system-config-printer cups cups-pdf foomatic=db{,-ppds,-nonfree,-nonfree-ppds,-engine,-gutenprint-ppds} gutenprint
pacman -S system-config-printer cups cups-pdf foomatic-db{,-ppds,-nonfree,-nonfree-ppds,-engine,-gutenprint-ppds} gutenprint
systemctl start org.cups.cupsd.service 
systemctl enable org.cups.cupsd.service 
pacman -S samba
pacman -S cups-filters ghostscript gsfonts 
pacman -S avahi
systemctl disable systemd-resolved.service
systemctl stop systemd-resolved.service
systemctl enable avahi-daemon.service 
systemctl start avahi-daemon.service 
pacman -S gnome gnome-extra
cd
pacman -Ss pulseaudio
pacman -S blueman
cd
exit
cd
cd /
fallocate -l 8192M /swapfile
chmod 600 /swapfile 
mkswap /swapfile 
mkswap -L SWAP /swapfile 
swapon /swapfile
vim /etc/fstab 
```
