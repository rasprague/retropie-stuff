#!/bin/bash

DIR=$(dirname "$0")
echo "Activatnig LCD 3.5 screen resolution . . . "
sudo cp $DIR/config.txt.lcd35 /boot/config.txt
echo "Setting headphones audio out . . . "
rm /home/pi/.asoundrc
ln -s $DIR/.asoundrc.headphones /home/pi/.asoundrc
echo "Done. Reboot system to appply changes."
sleep 1
