#!/bin/bash

DIR=$(dirname "$0")
echo "Activatnig LCD 3.5 screen resolution . . . "
sudo cp $DIR/config.txt.lcd35 /bootconfig.txt
echo "Setting seeed2micvoicec audio out . . . "
rm /home/pi.asoundrc
ln -s $DIR/.asoundrc.seeed2micvoicec /home/pi.asoundrc
echo "Done. Reboot system to appply changes."
sleep 1
