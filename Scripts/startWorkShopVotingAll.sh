#!/bin/bash
# Run from web-mpc-p0

echo "Run SPDZ startup locally..."
./runSpdzStartup.sh

echo "Start SPDZ Engines..."
ssh spdz-mpc-p0 "/home/je0018/docker/runWorkshopVoting.sh"
ssh spdz-mpc-p1 "/home/je0018/docker/runWorkshopVoting.sh"
ssh spdz-mpc-p2 "/home/je0018/docker/runWorkshopVoting.sh"

echo "Start SPDZ proxies..."
ssh spdz-mpc-p0 "/home/je0018/docker/runSpdzProxy.sh"
ssh spdz-mpc-p1 "/home/je0018/docker/runSpdzProxy.sh"
ssh spdz-mpc-p2 "/home/je0018/docker/runSpdzProxy.sh"

echo "Run Workshop voting GUI and REST server..."
./runWorkshopVotingGui.sh