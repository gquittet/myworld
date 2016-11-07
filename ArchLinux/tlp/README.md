# TLP is a tool for battery saving
## Install these packages

    sudo pacman -S tlp tlp-rdw

Thinkpad only

    sudo pacman -S tp_smapi acpi_call

## Install the depedencies

   sudo pacman -S lsb-release smartmontools
    
## Enable TLP

    sudo systemctl enable tlp.service
    sudo systemctl enable tlp-sleep.service

## Disable the systemd service to avoid conflicts

    sudo systemctl mask systemd-rfkill.service
    
