#!/bin/bash

DEVICE="hw:CARD=Headphones,DEV=0"
RATE=44100
PERIOD=1024
N_IN=0
N_OUT=2

pushd $(dirname $0)
./norns.sh -d $DEVICE -r $RATE -p $PERIOD -i $N_IN -o $N_OUT
popd
