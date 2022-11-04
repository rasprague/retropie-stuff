#!/bin/bash

# alsamixer

# button-to-keyboard mappings:
# * cursor keys for axis/dpad
# * enter (0x0a), ESC (0x1b), TAB (0x09), F6 for buttons 'a','b','x','y'
# * F1, F2 for buttons lt,rt (shoulder buttons)
#           l     r     u     d    a    b    x   y  lt  rt
params=(kcub1 kcuf1 kcuu1 kcud1 0x0a 0x1b 0x09 kf6 kf1 kf2)

# when this script is launched from retropiemenu, a default joy2key is launched
# kill it before setting up a custom joy2key mapping
sudo /opt/retropie/admin/joy2key/joy2key stop

/opt/retropie/admin/joy2key/joy2key start "${params[@]}"
alsamixer
echo "Quitting . . ."
/opt/retropie/admin/joy2key/joy2key stop
echo "Done."
clear
