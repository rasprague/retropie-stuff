#!/bin/bash

timedatectl --no-pager | grep "System clock synchronized: yes"
if [ $? -eq 0 ]; then
    pushd ~/code/ncurses-clock
    ./ncurses-clock -24h
    popd
else
    echo "Time not set via NTP"
    echo "Press (Enter) to exit"
    read
fi
