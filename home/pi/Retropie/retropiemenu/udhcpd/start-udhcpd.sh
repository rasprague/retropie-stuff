#!/bin/sh

ETHIP="192.168.13.1"

echo "Starting udhcpd on eth0($ETHIP) . . ."

sudo ifconfig eth0 $ETHIP
sudo busybox udhcpd -I $ETHIP udhcpd.conf

echo "done."
