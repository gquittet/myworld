# My eOS setup

## Complete language installation

Go to System Settings > Language & Region

## Install software properties

```
sudo apt install software-properties-common software-properties-gtk
```

1. Open it
2. Setup Canonical Partners


## Install drivers automatically

```
sudo ubuntu-drivers autoinstall
```

## Intel driver

```
sudo apt install intel-microcode
```


## Recent kernel and drivers (not recommended)

```
sudo apt install --install-recommends linux-generic-hwe-18.04
```

### Always update open-source graphics driver (preferred way)

```
sudo add-apt-repository ppa:oibaf/graphics-drivers
sudo apt-get update
```

or

```
sudo apt install --install-recommends xserver-xorg-hwe-18.04
```


## Battery optimization

Install TLP and powertop

### TLP

```
sudo add-apt-repository ppa:linrunner/tlp
sudo apt update
sudo apt install tlp tlp-rdw
```

If you have a ThinkPad

1. New ThinkPad

> sudo apt install acpi-call-dkms

2. Old ThinkPad

> sudo apt install tp-smapi-dkms acpi-call-dkms

### Powertop

```
sudo apt install powertop
```

Run powertop and tweak the TLP configuration to see all goods in the PowerTop tunnable.

```
sudo vim /etc/default/tlp
```


## Backup

Install timeshift

```
sudo apt install timeshift
```

## Archive formats support

```
sudo apt-get install unace rar unrar p7zip-rar p7zip sharutils uudeview mpack arj cabextract
```

## QT bad scaling

Add this line to your $HOME/.profile

```
export QT_AUTO_SCREEN_SCALE_FACTOR=0
```
