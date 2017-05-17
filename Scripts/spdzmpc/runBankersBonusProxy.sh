#!/bin/bash

docker run -d --rm --name spdz-proxy-bankers --network=spdz_nw -e "SPDZ_HOST=bankers-bonus" -e "SPDZ_PORT=14000" -e "LOG_LEVEL=debug" -v /opt/spdz/logs/bankers:/usr/app/logs spdz/spdz-proxy:v0.4.0

