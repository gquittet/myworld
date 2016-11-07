# How to install Infinality font renderer on Arch Linux
## Edit /etc/pacman.conf
Add these line at the end

	[infinality-bundle]
	Server = http://bohoomil.com/repo/$arch

	[infinality-bundle-multilib]
	Server = http://bohoomil.com/repo/multilib/$arch

	[infinality-bundle-fonts]
	Server = http://bohoomil.com/repo/fonts

## Run these commands
	sudo pacman-key -r 962DDE58
	sudo pacman-key --lsign-key 962DDE58

## Update the repositories with
	sudo pacman -Syyu

## Replace the old packages with this command
	sudo pacman -S infinality-bundle infinality-bundle-multilib ibfonts-meta-base

## Restart the computer and it's done.
