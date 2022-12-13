#/bin/sh

FILE=$(mktemp fortune.XXXXXX)
/usr/games/fortune -o -c | fold -w74 -s > $FILE

dialog --textbox $FILE 80 80

rm $FILE
