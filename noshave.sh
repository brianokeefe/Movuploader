#!/bin/sh

email="$1"
pass="$2"

cd ~/Pictures/Photo\ Booth\ Library/Pictures
old=$(ls -t | head -1)
new=$(date +%d).jpg
mv "$old" "$new"

entity=`curl -L -s -c cookie -d email=$email -d password=$pass -d rememberme=0 -d process=1 -d submit=1 -d redirect=0 https://www.movember.com/us/auth/do-login | grep 'http://mobro.co/' | tail -n 1 | awk {'print $2'} | sed "s,'http://mobro.co/,," | sed "s/',//"`

curl -s -b cookie http://us.movember.com/mospace/your-donation-page/create-post/ -F content=$new -F entity_id=$entity -F name=image -F "filename=$new;image/jpeg;" -F "image=@$new"

rm -rf cookie
