#!/bin/bash

# Menu-driven and On-screen Keyboard for your RetroPie pleasure
# connect to a Wifi network via network-manager

dialog --infobox "Scanning for Wifi networks . . ." 3 36

OSK_BIN="/home/pi/RetroPie-Setup/scriptmodules/admin/joy2key/osk.py"

SSID=""
OUTPUT=$(sudo nmcli -f SSID dev wifi list)
if [ $? -eq 0 ]; then
    SSID_CMD="dialog --stdout --title \"Choose an SSID\" --menu \"Choose an SSID\" 20 80 20"
    # cut the 1st line, remove -- entries, trim whitespace, and sort 'em
    OUTPUT=$(echo "$OUTPUT" | sed '1d' | sed '/^--/d' | awk '{$1=$1};1' | sort)
    IFS=$'\n' SSIDS=($OUTPUT)
    SSID_LIST=""
    I=0
    while read line; do
	SSID_LIST="$SSID_LIST $I \"$line\""
	((I=I+1))
    done <<< "$OUTPUT"
    SSID_I=$(eval $SSID_CMD $SSID_LIST)
    [ $? -ne 0 ] && echo "Cancelled." && exit 1
    SSID=${SSIDS[$SSID_I]}
else
    echo "womp womp"
    exit 1
fi

PASSWORD=""
TMPFILE=$(mktemp /tmp/wifi-connect.XXXXXX)
python3 "$OSK_BIN" --backtitle "Enter Password" --inputbox "Password for $SSID" 2>$TMPFILE
if [ $? -eq 0 ]; then
    PASSWORD=$(cat "$TMPFILE")
    rm "$TMPFILE"
else
    echo "Canceled."
    rm "$TMPFILE"
    exit 1
fi

echo "Connecting to '$SSID' with password '$PASSWORD'"
sudo nmcli device wifi connect "'$SSID'" password "'$PASSWORD'"
echo "done."
