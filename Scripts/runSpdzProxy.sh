#!/bin/bash
# SPDZ proxy which runs in front of each SPDZ engine.
# Uses user defined bridge network to communicate with spdz container
#   docker network create --driver bridge spdz_nw

docker run -d --rm --name spdz-proxy --network=spdz_nw -p 443:8443 -e "SPDZ_HOST=workshop-voting" -e "SPDZ_PORT=14000" -e "REST_PORT=8443" -e "LOG_LEVEL=debug" -v /opt/spdz/logs:/usr/app/logs -v /opt/spdz/certs:/usr/app/certs spdz/spdz-proxy:v0.3.1