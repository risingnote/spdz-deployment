#!/bin/bash

docker run -d --rm --name workshop-voting-gui --network=spdz_nw -e "NODE_TLS_REJECT_UNAUTHORIZED=0" -e "LOG_LEVEL=debug" -v /opt/spdz/voting-gui-config:/usr/app/config -v /opt/spdz/logs:/usr/app/logs spdz/workshop-voting-gui:v0.1.4

