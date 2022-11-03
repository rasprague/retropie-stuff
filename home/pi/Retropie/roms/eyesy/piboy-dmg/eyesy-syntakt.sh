#!/bin/bash
DEVICE="default:CARD=Syntakt"
RATE=48000
CONTROLLER_MAPPING="piboy-mapping.py"

pushd /home/pi/Eyesy
./start_python_foreground.sh --device $DEVICE --rate $RATE --controller-mapping $CONTROLLER_MAPPING
popd
