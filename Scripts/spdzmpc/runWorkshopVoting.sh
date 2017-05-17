#!/bin/bash

docker run -d --rm --name workshop-voting --network=spdz_nw --expose 13010 -p 13010:13010 --env playerId=0 --env basePort=13010 --env startupHost=172.25.2.234 -v /opt/spdz/Voters/Player-Data:/usr/spdz/Player-Data -v /opt/spdz/logs/voters:/usr/spdz/logs -v /opt/spdz/Persistence:/usr/spdz/Persistence spdz/workshop-voting:v0.3.5

