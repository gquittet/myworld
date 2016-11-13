# TLP is a tool for battery saving
## Install these packages

    sudo pacman -S tlp tlp-rdw

Thinkpad only

    sudo pacman -S tp_smapi acpi_call

## Install the dependencies

    sudo pacman -S lsb-release smartmontools x86_energy_perf_policy

## Enable TLP

    sudo systemctl enable tlp.service
    sudo systemctl enable tlp-sleep.service

## Disable the systemd service to avoid conflicts

    sudo systemctl mask systemd-rfkill.service
