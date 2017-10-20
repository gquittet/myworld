qemu-system-x86_64 \
    -cdrom file.iso \
    -boot order=d \
    -drive file=hdd,format=qcow2 \
    -enable-kvm \
    -device intel-iommu \
    -machine q35,accel=kvm \
    -cpu host \
    -m 2G \
    -net nic \
    -net user,smb='/absolute/path/to/folder'

