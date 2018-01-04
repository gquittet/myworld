#/bin/bash

maildir="$HOME/.mails/*/*"
maildirnew="$maildir/new/"
maildirold="$maildir/cur/"

icon="/usr/share/icons/Papirus-Dark/64x64/apps/evolution-mail.svg"

offlineimap -o -u quiet

new=$(find $maildirnew -type f | wc -l)
old=$(find $maildirold -type f | wc -l)

if [ $new -gt 0 ]
then
    title="$new new email!"
    content="You've got new emails. Read it as soon as possible!"
    notify-send -i "$icon" "$title" "$content"
fi
