# Install Wireshark in Archlinux

## Install the gtk package

    sudo pacman -S wireshark-gtk wireshark-common wireshark-cli


## Add user to the wireshark group
Use wireshark as root is very insecure. So add your user to the wireshark group to capture packet.

    sudo gpasswd -a your_username wireshark

