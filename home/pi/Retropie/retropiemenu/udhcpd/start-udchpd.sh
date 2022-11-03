#!/bin/sh

ETHIP="192.168.13.1"

echo "Starting udhcpd on eth0($ETHIP) . . ."

sudo ifconfig eth0 $ETHIP
sudo busybox udhcpd -I $ETHIP /home/pi/etc/udhcpd/udhcpd.conf

echo "done."
