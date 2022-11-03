#!/bin/bash

echo "Activatnig LCD 3.5 screen resolution . . . "
cd /boot
sudo cp config.txt.lcd35 config.txt
echo "Setting default audio out . . . "
rm -f "$home/.asoundrc"
echo "Done. Reboot system to appply changes."
sleep 1
