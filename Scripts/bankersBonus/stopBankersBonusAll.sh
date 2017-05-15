#!/bin/bash

echo "Stopping voting GUI and REST service..."
docker stop bankers-bonus-gui

echo "Stopping services on spdz-mpc-p0..."
ssh spdz-mpc-p0 "docker stop spdz-proxy-bankers"
ssh spdz-mpc-p0 "docker stop bankers-bonus"

echo "Stopping services on spdz-mpc-p1..."
ssh spdz-mpc-p1 "docker stop spdz-proxy-bankers"
ssh spdz-mpc-p1 "docker stop bankers-bonus"

echo "Stopping services on spdz-mpc-p2..."
ssh spdz-mpc-p2 "docker stop spdz-proxy-bankers"
ssh spdz-mpc-p2 "docker stop bankers-bonus"

