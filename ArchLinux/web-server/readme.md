# Install a web server on ArchLinux
Don't forget to go on the wiki and to check if this configuration is updated.

## Install Apache and PHP

	sudo pacman -S apache php php-apache

## Uncomment these folowing lines in the file: /etc/php/php.ini

	extension=mysqli.so
	extension=pdo_mysql.so

## Edit the content below in this file: /etc/httpd/conf/httpd.conf

### Add at the end of the loading of the modules (LoadModule)

	# Load php7 module
	LoadModule php7_module modules/libphp7.so

### Add at the end of the includes loading (Includes)

    # PHP settings
	Include conf/extra/php7_module.conf

## Fix the php extension
Comment this line in the /etc/httpd/conf/httpd.conf file

    #LoadModule mpm_event_module modules/mod_mpm_event.so

Uncomment this line in the same file

    LoadModule mpm_prefork_module modules/mod_mpm_prefork.so

Add the handler at the end of LoadModule

    AddHandler php7-script php

## Run the apache server with the computer

	systemctl enable httpd

## Start it

	systemctl start httpd
