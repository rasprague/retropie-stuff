#!/bin/bash
echo "Starting remote.it  . . ."
sudo systemctl start remoteit@80:00:00:00:01:23:D0:66 remoteit@80:00:00:00:01:23:D0:67 schannel
echo "Done."
