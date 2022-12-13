#/bin/sh

FILE=$(mktemp fortune.XXXXXX)
/usr/games/fortune /usr/share/games/fortunes/off/limerick | fold -w74 -s > $FILE

dialog --textbox $FILE 80 80

rm $FILE
