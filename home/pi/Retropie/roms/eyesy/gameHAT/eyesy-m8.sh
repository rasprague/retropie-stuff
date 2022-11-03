#!/bin/bash
DEVICE="default:CARD=M8"
RATE=44100
DOUBLEBUF=0
CONTROLLER_MAPPING="gamehat-mapping.py"

pushd /home/pi/Eyesy
./start_python_foreground.sh --device $DEVICE --rate $RATE --double-buffer $DOUBLEBUF --controller-mapping $CONTROLLER_MAPPING
popd
