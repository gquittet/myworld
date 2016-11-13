# Install a Uncomplicated FireWall

ufw is a firewall that is very simple to configure. By default, GNU/Linux use iptables but it's very difficult to configure.

## Install this package

    sudo pacman -S ufw

## Enable ufw and start it

    sudo systemctl enable ufw
    sudo systemctl start ufw
    sudo ufw enable

## To see if ufw is activate

    sudo ufw status

