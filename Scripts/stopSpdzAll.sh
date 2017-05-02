#!/bin/bash

echo "Stopping voting GUI and REST service..."
docker stop workshop-voting-gui

echo "Stopping servies on spdz-mpc-p0..."
ssh spdz-mpc-p0 "docker stop spdz-proxy"
ssh spdz-mpc-p0 "docker stop workshop-voting"

echo "Stopping servies on spdz-mpc-p1..."
ssh spdz-mpc-p1 "docker stop spdz-proxy"
ssh spdz-mpc-p1 "docker stop workshop-voting"

echo "Stopping servies on spdz-mpc-p2..."
ssh spdz-mpc-p2 "docker stop spdz-proxy"
ssh spdz-mpc-p2 "docker stop workshop-voting"