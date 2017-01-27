# How to install virtualbox on ArchLinux

## Install these packages

### If you use the linux kernel

You need to choose this modules after paste the below command into a terminal: *virtualbox-host-modules-arch*

```
sudo pacman -S virtualbox virtualbox-guest-iso net-tools vde2
```

### If you use the linux-lts kernel

You need to choose this modules after paste the below command into a terminal: *virtualbox-host-dkms*

```
sudo pacman -S virtualbox linux-lts-headers virtualbox-guest-iso net-tools vde2
```

## Add your account to the vboxusers group

```
sudo gpasswd -a yourusername vboxusers
```

## Get the extension pack

```
yaourt virtualbox-ext-oracle
```

Don't forget to reboot your machine because the kernel need to load the virtualbox module.

## If you need to load the *vboxdrv* modules

```
sudo modprobe vboxdrv
```
