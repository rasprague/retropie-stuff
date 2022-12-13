#!/bin/bash
DEVICE="hw:CARD=Device,DEV=0"
RATE=44100
PERIOD=512
DOUBLEBUF=0
KEEPALIVESERVER="None"
CONTROLLER_MAPPING="dummy"

pushd /home/pi/Eyesy
./start_python_foreground.sh --device $DEVICE --rate $RATE --period $PERIOD --double-buffer $DOUBLEBUF --keepalive-server $KEEPALICESERVER --controller-mapping $CONTROLLER_MAPPING
popd
