#!/bin/bash
DEVICE="default:CARD=Device"
RATE=44100
REMOTECONTROL_CLIENT='192.168.1.113'
CONTROLLER_MAPPING="piboy-mapping.py"
REMOTECONTROLSERVER=0

pushd /home/pi/Eyesy
./start_python_foreground.sh --device $DEVICE --rate $RATE --remotecontrol-client $REMOTECONTROL_CLIENT --controller-mapping $CONTROLLER_MAPPING --remotecontrol-server $REMOTECONTROL_SERVER
popd
