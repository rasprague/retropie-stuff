#!/bin/bash

echo "Killing udhcpd . . ."

sudo pkill -f "busybox udhcpd"

echo "done."
