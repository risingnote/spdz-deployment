#!/bin/bash

echo "Stopping local nginx proxy..."
docker stop -t 2 nginx-proxy

echo "Stopping remote nginx proxy on spdz-mpc-p0..."
ssh spdz-mpc-p0 "docker stop -t 2 nginx-proxy"

echo "Stopping remote nginx proxy on spdz-mpc-p1..."
ssh spdz-mpc-p1 "docker stop -t 2 nginx-proxy"

echo "Stopping remote nginx proxy on spdz-mpc-p2..."
ssh spdz-mpc-p2 "docker stop -t 2 nginx-proxy"

