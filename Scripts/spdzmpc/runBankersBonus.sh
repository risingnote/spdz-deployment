#!/bin/bash

docker run -d --rm --name bankers-bonus --network=spdz_nw --expose 13000 -p 13000:13000 --env playerId=0 --env basePort=13000 --env startupHost=172.25.2.234 -v /opt/spdz/Bankers/Player-Data:/usr/spdz/Player-Data -v /opt/spdz/logs/bankers:/usr/spdz/logs spdz/bankers-bonus:v0.6.0

