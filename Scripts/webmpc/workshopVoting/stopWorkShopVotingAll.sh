#!/bin/bash

echo "Stopping voting GUI and REST service..."
docker stop -t 2 workshop-voting-gui

echo "Stopping services on spdz-mpc-p0..."
ssh spdz-mpc-p0 "docker stop -t 2 spdz-proxy-voting"
ssh spdz-mpc-p0 "docker stop -t 2 workshop-voting"

echo "Stopping services on spdz-mpc-p1..."
ssh spdz-mpc-p1 "docker stop -t 2 spdz-proxy-voting"
ssh spdz-mpc-p1 "docker stop -t 2 workshop-voting"

echo "Stopping services on spdz-mpc-p2..."
ssh spdz-mpc-p2 "docker stop -t 2 spdz-proxy-voting"
ssh spdz-mpc-p2 "docker stop -t 2 workshop-voting"

