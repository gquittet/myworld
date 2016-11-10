# Installation d'un serveur web sous ArchLinux
N'oubliez pas de vérifier sur le wiki si la configuration est à jour.

## Install Apache and PHP

	sudo pacman -S apache php php-apache

## Décommentez les lignes suivantes du fichier: /etc/php/php.ini

	extension=mysqli.so
	extension=pdo_mysql.so

## Rajoutez le contenu suivant dans ce fichier: /etc/httpd/conf/httpd.conf

### Ajoutez dans à la fin des chargements de modules (LoadModule)

	# Load php7 module
	LoadModule php7_module modules/libphp7.so

### Ajoutez à la fin des includes des fichiers de configurations (Includes)

    # PHP settings
	Include conf/extra/php7_module.conf

## Fix the php extension
Comment this line in the /etc/httpd/conf/httpd.conf file

    #LoadModule mpm_event_module modules/mod_mpm_event.so

Uncomment this line in the same file

    LoadModule mpm_prefork_module modules/mod_mpm_prefork.so

Add the handler at the end of LoadModule

    AddHandler php7-script php

## Démarrez automatiquement le serveur Apache

	systemctl enable httpd

## Lancez-le

	systemctl start httpd
