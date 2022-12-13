#!/bin/bash
DEVICE="hw:CARD=Device,DEV=0"
RATE=44100
PERIOD=512
DOUBLEBUF=0
CONTROLLER_MAPPING="nes30pro-mapping.py"
REMOTECONTROL_CLIENT="192.168.1.113"

pushd /home/pi/Eyesy
./start_python_foreground.sh --device $DEVICE --rate $RATE --period $PERIOD --double-buffer $DOUBLEBUF --remotecontrol-client $REMOTECONTROL_CLIENT --controller-mapping $CONTROLLER_MAPPING
popd
