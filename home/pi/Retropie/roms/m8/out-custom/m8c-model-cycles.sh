#!/bin/bash

# set this to the audio interface device number or name
# you wish to use with m8-headless
# see output from command aplay -l
HWAUDIODEVICE=ModelCycles

# set this to the sample rate
RATE=48000

# set to 0 to disable audio input, 1 to enable audio input
ENABLEINPUT=1

###############################################################################
OPTIONS=""

if [ ENABLEAUDIOINPUT = 1 ]; then
    OPTIONS+=" --enable-input"
fi

pushd /home/pi/code/m8c-piboy
./m8c.sh --interface $HWAUDIODEVICE --rate $RATE $OPTIONS
popd
