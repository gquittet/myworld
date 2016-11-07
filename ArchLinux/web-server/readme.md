# Installation d'un serveur web sous ArchLinux

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

## Démarrez automatiquement le serveur Apache

	systemctl enable httpd

## Lancez-le

	systemctl start httpd

## Rajoutez le hostname de la machine (chez moi alien) dans le fichier /etc/hosts

	#
    # /etc/hosts: static lookup table for host names
	#
	#<ip-address>    <hostname.domain.org>    <hostname>
	127.0.0.1    localhost.localdomain    localhost alien
    # End of file
