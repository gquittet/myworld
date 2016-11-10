# Install SQL to ArchLinux
ArchLinux has replaced mysql with MariaDB because it's more efficient

## Install MariaDB

	sudo pacman -S mariadb

## Configure it

	sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

## Enable it and start it

	sudo systemctl enable mysqld.service
	sudo systemctl enable mariadb.service
	sudo systemctl start mysqld.service
	sudo systemctl start mariadb.service

## Change the password with this command

	sudo mysql_secure_installation

If this doesn't work, use this:

	mysqladmin -u root password [newpassword]

After set a password retry the configuration:

	sudo mysql_secure_installation
