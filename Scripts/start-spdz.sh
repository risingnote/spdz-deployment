#!/bin/bash

SPDZROOT=$(cd `dirname $0`; pwd)

if ! test -e $SPDZROOT/logs; then
    mkdir $SPDZROOT/logs;
fi

export PLAYER_NO=0

./Player-Online.x -lgp 128 -lg2 40 -h 172.25.2.234 -pn 13000 $PLAYER_NO workshop_voting > $SPDZROOT/logs/spdz.log 2>&1 &

echo $! > $SPDZROOT/spdz.pid

echo "Started spdz for player $PLAYER_NO."
