# How to install virtualbox on ArchLinux

## Install these packages

```
sudo pacman -S virtualbox virtualbox-guest-iso net-tools vde2
```

## Add your account to the vboxusers group

```
sudo gpasswd -a yourusername vboxusers
```

## Get the extension pack

```
yaourt virtualbox-ext-oracle
```

## If you need to load the *vboxdrv* modules

```
sudo modprobe vboxdrv
```
