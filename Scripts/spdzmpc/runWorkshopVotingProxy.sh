#!/bin/bash

docker run -d --rm --name spdz-proxy-voting --network=spdz_nw -e "SPDZ_HOST=workshop-voting" -e "SPDZ_PORT=14000" -e "LOG_LEVEL=debug" -v /opt/spdz/logs/voters:/usr/app/logs spdz/spdz-proxy:v0.4.0

