#!/bin/bash

DEVICE="default"
RATE=44100
PERIOD=128
N_IN=2
N_OUT=2

ARGS=$@

function usage()
{
    echo "Start norns"
    echo "Usage $0"
    echo "  options:"
    echo "    [ -d | --device ] <D> - use audio device D, defaults to 'default'"
    echo "    [ -r | --rate ] <R> - use R sample rate, defaults to 44100"
    echo "    [ -p | --period ] <P> - use P period, defaults to 1024"
    echo "    [ -i | --num_ins ] <I> - set number of audio inputs to I"
    echo "    [ -o | --num_outs ] <O> - set number of audio outputs to O"
    echo "    [ -h | --help ] show this helpful message"
}

function parseargs()
{
    OPTIONS=$(getopt -o d:r:p:i:o:h --long device:,rate:,period:,num_ins:,num_outs:,help -- $ARGS)
    if [ $? -ne -0 ]; then
	usage
	exit 1
    fi

    eval set -- "$OPTIONS"

    while true; do
	case "$1" in
	    -d|--device)
		DEVICE=$2 ; shift 2 ;;
	    -r|--rate)
		RATE=$2 ; shift 2 ;;
	    -p|--period)
		PERIOD=$2 ; shift 2 ;;
	    -i|--num_ins)
		N_IN=$2 ; shift 2 ;;
	    -o|--num_outs)
		N_OUT=$2 ; shift 2 ;;
	    -h|--help)
		usage ; shift ; exit 0 ;;
	    --)
		shift ; break ;;
	esac
    done
}

function startup()
{
    # start jackd, crone, sclang, and maiden in background
    /usr/bin/jackd -R -P 95 -d alsa -i $N_IN -o $N_OUT -d $DEVICE -r $RATE -n 3 -p $PERIOD -S -s |& tee /tmp/norns.jackd.log &
    /usr/bin/jack_wait -w -t 60

    norns/build/crone/crone |& tee /tmp/norns.crone.log &

    QT_QPA_PLATFORM=offscreen /home/we/norns/build/ws-wrapper/ws-wrapper ws://*:5556 /usr/bin/sclang -i maiden |& tee /tmp/norns.sclang.log &

    maiden/maiden server --app maiden/app/build --data ~/dust --doc ~/norns/doc |& tee /tmp/norns.maiden.log &

    sleep 5

    # start matron in foreground
    norns/build/matron/matron |& tee /tmp/norns.matron.log
}

function cleanup()
{
    killall matron maiden sclang crone jackd
}

trap cleanup EXIT SIGHUP SIGTERM
parseargs
pushd /home/we
startup
cleanup
popd
