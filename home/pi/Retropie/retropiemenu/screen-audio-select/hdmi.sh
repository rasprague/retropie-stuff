#!/bin/bash

echo "Activatnig HDMI screen resolution . . . "
cd /boot
sudo cp config.txt.hdmi config.txt
echo "Setting HDMI audio out . . . "
cd /home/pi
rm .asoundrc
ln -s .asoundrc.hdmi1 .asoundrc
echo "Done. Reboot system to appply changes."
sleep 1
