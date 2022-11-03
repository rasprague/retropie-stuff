#!/bin/bash
DEVICE="hw:CARD=seeed2micvoicec,DEV=0"
RATE=44100
DOUBLEBUF=0
CONTROLLER_MAPPING="nes30pro-mapping.py"

pushd /home/pi/Eyesy
./start_python_foreground.sh --device $DEVICE --rate $RATE --double-buffer $DOUBLEBUF --controller-mapping $CONTROLLER_MAPPING
popd
