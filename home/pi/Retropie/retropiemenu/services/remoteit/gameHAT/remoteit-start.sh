#!/bin/bash
echo "Starting remote.it  . . ."
sudo systemctl start remoteit@80:00:00:00:01:25:02:13 remoteit@80:00:00:00:01:25:02:14 schannel
echo "Done."
