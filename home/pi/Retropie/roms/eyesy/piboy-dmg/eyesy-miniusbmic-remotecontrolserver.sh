#!/bin/bash
DEVICE="default:CARD=Device"
RATE=44100
CONTROLLER_MAPPING="piboy-mapping.py"
REMOTECONTROLSERVER=1

pushd /home/pi/Eyesy
./start_python_foreground.sh --device $DEVICE --rate $RATE --controller-mapping $CONTROLLER_MAPPING --remotecontrol-server $REMOTECONTROL_SERVER
popd
