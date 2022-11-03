#!/bin/bash

echo "Activatnig LCD 3.5 screen resolution . . . "
cd /boot
sudo cp config.txt.lcd35 config.txt
echo "Setting headphones audio out . . . "
cd /home/pi
rm .asoundrc
ln -s .asoundrc.headphones .asoundrc
echo "Done. Reboot system to appply changes."
sleep 1
