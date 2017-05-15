#!/bin/bash

docker run -d --rm --name bankers-bonus-gui --network=spdz_nw -p 8080:8080 -e "LOG_LEVEL=debug" -v /opt/spdz/bankers-gui-config:/usr/app/config -v /opt/spdz/logs:/usr/app/logs spdz/bankers-bonus-gui:v0.5.1

