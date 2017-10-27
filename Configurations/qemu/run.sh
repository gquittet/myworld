#!/bin/bash
qemu-system-x86_64 \
    -cdrom cdrom.iso \
    -boot order=d \
    -drive file=hdd,format=qcow2 \
    -enable-kvm \
    -device intel-iommu \
    -machine q35,accel=kvm \
    -cpu host \
    -m 2G \
    -vga std \
    -display sdl,gl=on \
    -nodefaults \
    -monitor telnet:localhost:7005,server,nowait,nodelay \
    -serial telnet:localhost:7015,server,nowait,nodelay \
    -soundhw hda \
    -net nic \
    #-net bridge,br=br0 \
    -net user,smb='/absolute/path/to/folder'
