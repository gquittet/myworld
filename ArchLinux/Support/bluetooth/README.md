# Install bluetooth on ArchLinux

## Install these packages

    sudo pacman -S bluez bluez-utils obexfs blueman

## Load the bluetooth driver

    sudo modprobe btusb

## Edit ***/etc/systemd/system/bluetooth.target.wants/bluetooth.service***

Find this line:

    ExecStart=/usr/lib/bluetooth/bluetoothd

And edit it like this:

    ExecStart=/usr/lib/bluetooth/bluetoothd --noplugin=sap

## Reload the services

    sudo systemctl daemon-reload

## Enable and start bluetooth

    sudo systemctl enable bluetooth.service
    sudo systemctl start bluetooth.service
