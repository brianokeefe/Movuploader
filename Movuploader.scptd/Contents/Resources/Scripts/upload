#!/bin/sh

cd /Users/bok/Pictures/Photo\ Booth\ Library/Pictures
old=$(ls -t | head -1)
new=$(date +%d).jpg
mv "$name" $new
scp $new bok@bokstuff.com:/var/www/stkbuzz.com/public_html/noshave/pics
ssh bokstuff.com "cd /var/www/stkbuzz.com/public_html/noshave && ./genjson"
