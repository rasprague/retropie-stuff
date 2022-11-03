#!/bin/bash

COMMAND="aconnect -l"

TMPFILE=$(mktemp)
> $TMPFILE

echo "$ $COMMAND" >> $TMPFILE
echo ""
$COMMAND >> $TMPFILE
echo "" >> $TMPFILE
/opt/retropie/admin/joy2key/joy2key start
dialog --textbox $TMPFILE 30 76
echo "Quitting."
rm $TMPFILE
/opt/retropie/admin/joy2key/joy2key stop
clear
