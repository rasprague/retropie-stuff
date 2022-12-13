#!/bin/bash

pushd /home/we

# start jackd, crone, sclang, and maiden in background
#/usr/bin/jackd -R -P 95 -d alsa -d hw:sndrpimonome -r 48000 -n 3 -p 128 -S -s &
/usr/bin/jackd -R -P 95 -d alsa -d hw:CARD=M8,DEV=0 -r 44100 -n 3 -p 512 -S -s 2>&1 > /tmp/norns.jackd.log &
/usr/bin/jack_wait -w -t 60

norns/build/crone/crone 2>&1 > /tmp/norns.crone.log &

QT_QPA_PLATFORM=offscreen /home/we/norns/build/ws-wrapper/ws-wrapper ws://*:5556 /usr/bin/sclang -i maiden 2>&1 > /tmp/norns.sclang.log &

maiden/maiden server --app maiden/app/build --data ~/dust --doc ~/norns/doc > /tmp/norns.maiden.log &

sleep 5

# start matron in foreground
norns/build/matron/matron 2>&1 > /tmp/norns.matron.log

# cleanup
killall matron maiden sclang crone jackd
popd
