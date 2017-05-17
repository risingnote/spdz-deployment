#!/bin/bash

HERE=$(cd `dirname $0`; pwd)

echo "Run SPDZ startup locally..."
$HERE/runSpdzStartup.sh

echo "Start SPDZ Engines..."
ssh spdz-mpc-p0 "/home/je0018/docker/runWorkshopVoting.sh"
ssh spdz-mpc-p1 "/home/je0018/docker/runWorkshopVoting.sh"
ssh spdz-mpc-p2 "/home/je0018/docker/runWorkshopVoting.sh"

echo "Start SPDZ proxies..."
ssh spdz-mpc-p0 "/home/je0018/docker/runWorkshopVotingProxy.sh"
ssh spdz-mpc-p1 "/home/je0018/docker/runWorkshopVotingProxy.sh"
ssh spdz-mpc-p2 "/home/je0018/docker/runWorkshopVotingProxy.sh"

echo "Run Workshop voting GUI and REST server..."
$HERE/runWorkshopVotingGui.sh
