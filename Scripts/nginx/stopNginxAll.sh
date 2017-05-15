#!/bin/bash

echo "Stopping local nginx proxy..."
docker stop nginx-proxy

echo "Stopping remote nginx proxy on spdz-mpc-p0..."
ssh spdz-mpc-p0 "docker stop nginx-proxy"

echo "Stopping remote nginx proxy on spdz-mpc-p1..."
ssh spdz-mpc-p1 "docker stop nginx-proxy"

echo "Stopping remote nginx proxy on spdz-mpc-p2..."
ssh spdz-mpc-p2 "docker stop nginx-proxy"

