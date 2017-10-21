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
    -soundhw hda \
    -net nic \
    -net user,smb='/absolute/path/to/folder' \
    -nodefaults \
    -monitor telnet:127.0.0.1:7005,server,nowait

