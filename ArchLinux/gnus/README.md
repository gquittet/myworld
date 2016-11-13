# Use Gnus with Emacs on ArchLinux

Gnus is a mail client to read and send email. It's very useful. To work with it,
you need to install offlineimap to store a copy of your mail on your computer.
You need to install dovecot to access to this mail.

## Install these packages

    sudo pacman -S offlineimap dovecot

## Configure offlineimap

Write your configuration inside ~/.offlineimaprc and write a python script that
decrypt your password. It's better to encrypt all of your data. You can find an
exemple of offlimeimaprc here -> [Click on me :)](https://github.com/GuillaumeQuittet/myworld/blob/master/emacs/.offlineimaprc)
To download the python script that is useful to decrypt your password, [Click on me :)](https://github.com/GuillaumeQuittet/myworld/blob/master/emacs/.offlineimap-password.py)

### Edit the python script

Change this line:

    path = "/home/gquittet/.passwd/%s.gpg" % acct

With your home path.

Change the mail folder in the .offlineimaprc file

### Write a authinfo.gpg file with this settings:

    machine imap.gmail.com login <USER> password <PASSWORD> port imaps
    machine smtp.gmail.com login <USER> password <PASSWORD> port 587

### Edit the ~/.profile file:

    export EMAIL="<EMAIL_ADDRESS>"
    export NAME="<FULL NAME>"
    export SMTPSERVER="smtp.gmail.com"

### My Gnus configuration:
In emacs:

     (setq gnus-always-read-dribble-file t)
    (setq message-directory "~/Documents/Cloud/Mails")
    (setq gnus-secondary-select-methods
        '((nnmaildir "GMail" (directory "~/Documents/Cloud/Mails"))))
    (setq user-mail-address "guillaume.quittet@gmail.com")
    (setq gnus-ignored-from-addresses "guillaume.quittet")
    (setq gnus-directory "~/Documents/Cloud/Mails/News/")
    (setq nnfolder-directory "~/Documents/Cloud/Mails/Archives/")

In the ~/.gnus file

    (setq gnus-select-method
        '(nnimap "Mail"
            (nnimap-address "localhost")
            (nnimap-stream network)
            (nnimap-authenticator login)))

    (setq user-mail-address "guillaume.quittet@gmail.com")
    (setq gnus-ignored-from-addresses "gquittet")
    (setq gnus-message-archive-group
        '((".*" "nnimap+myserver:Sent Items")))


To configure Gnus for Emacs go to this site : [https://www.emacswiki.org/emacs/GnusGmail](https://www.emacswiki.org/emacs/GnusGmail)

### Configure dovecot

#### Copy the configuration file from the sample file:

    sudo cp /etc/ssl/dovecot-openssl.cnf{.sample,}

#### Edit /etc/ssl/dovecot-openssl.cnf to configure the certificate
#### Execute /usr/lib/dovecot/mkcert.sh to generate the certificate:

    sudo sh /usr/lib/dovecot/mkcert.sh

#### Run this command to copy the certificate to the certificates folder:

    sudo cp /etc/ssl/certs/dovecot.pem /etc/ca-certificates/trust-source/anchors/dovecot.crt

#### And then, whenever you have changed your certificate.

    sudo trust extract-compat

#### Copy the dovecot.conf and conf.d/* configuration files from /usr/share/doc/dovecot/example-config to /etc/dovecot

    sudo cp /usr/share/doc/dovecot/example-config/dovecot.conf /etc/dovecot
    sudo cp -r /usr/share/doc/dovecot/example-config/conf.d /etc/dovecot

#### Edit in /etc/dovecot/conf.d/10-mail.conf, the mail location with your mail folder

    mail_location = maildir:~/Documents/Dropbox/Mails

### Enable dovecot and start it

    sudo systemctl enable dovecot.service
    sudo systemctl start dovecot.service

