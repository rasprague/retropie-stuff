#!/bin/bash
DEVICE="hw:CARD=Device,DEV=0"
RATE=44100
PERIOD=512
DOUBLEBUF=0
CONTROLLER_MAPPING="gamehat-mapping.py"

pushd /home/pi/Eyesy
./start_python_foreground.sh --device $DEVICE --rate $RATE --period $PERIOD --double-buffer $DOUBLEBUF --controller-mapping $CONTROLLER_MAPPING
popd
