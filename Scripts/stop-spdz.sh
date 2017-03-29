#!/bin/bash

SPDZROOT=$(cd `dirname $0`; pwd)

if [ -n "$(ls $SPDZROOT/spdz.pid)" ]
then
  read pid < $SPDZROOT/spdz.pid
  echo "Killing process $pid"
  kill $pid
  rm $SPDZROOT/spdz.pid
else
  echo "No processes to stop"
fi

