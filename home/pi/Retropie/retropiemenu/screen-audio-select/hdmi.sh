#!/bin/bash

DIR=$(dirname "$0")
echo "Activatnig HDMI screen resolution . . . "
sudo cp $DIR/config.txt.hdmi /boot/config.txt
echo "Setting HDMI audio out . . . "
rm /home/pi/.asoundrc
ln -s $DIR/.asoundrc.hdmi1 /home/pi/.asoundrc
echo "Done. Reboot system to appply changes."
sleep 1
