#!/bin/bash

VM_NAME=thenameofthevm
RAM=4G
CPUS=4
VGA=qxl

qemu-system-x86_64                                                       \
    -name $VM_NAME                                                       \
    -boot order=c                                                        \
    -drive file=hdd.qcow2,format=qcow2                                   \
    -cpu host                                                            \
    -smp $CPUS                                                           \
    -m $RAM                                                              \
    -net nic                                                             \
    -net user,smb='/absolute/path/of/the/folder'                         \
    -enable-kvm                                                          \
    -device intel-iommu                                                  \
    -machine q35,accel=kvm                                               \
    -usb                                                                 \
    -vga $VGA                                                            \
    -display sdl,gl=on                                                   \
    -nodefaults                                                          \
    -monitor telnet:localhost:7005,server,nowait,nodelay                 \
    -serial telnet:localhost:7015,server,nowait,nodelay                  \
    -soundhw hda                                                         \
    -spice unix,addr=/tmp/$VM_NAME.socket,disable-ticketing              \
    -device virtio-serial-pci                                            \
    -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 \
    -chardev spicevmc,id=spicechannel0,name=vdagent                      \
    -device ich9-usb-ehci1,id=usb                                        \
    -device ich9-usb-uhci1,masterbus=usb.0,firstport=0,multifunction=on  \
    -device ich9-usb-uhci2,masterbus=usb.0,firstport=2                   \
    -device ich9-usb-uhci3,masterbus=usb.0,firstport=4                   \
    -chardev spicevmc,name=usbredir,id=usbredirchardev1                  \
    -device usb-redir,chardev=usbredirchardev1,id=usbredirdev1           \
    -chardev spicevmc,name=usbredir,id=usbredirchardev2                  \
    -device usb-redir,chardev=usbredirchardev2,id=usbredirdev2           \
    -chardev spicevmc,name=usbredir,id=usbredirchardev3                  \
    -device usb-redir,chardev=usbredirchardev3,id=usbredirdev3           \
    #-net bridge,br=br0
    # -cdrom elementaryos-5.0-stable.20181016.iso                        \
