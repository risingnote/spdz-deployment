#!/bin/bash
# Run the workshop-voting spdz engine (note ports are incremented by playerId for each party)
# Uses user defined bridge network to accept requests from spdz proxy

docker run -d --rm --name workshop-voting --network=spdz_nw --expose 14000 -p 14000:14000 --expose 13000 -p 13000:13000 --env playerId=0 --env startupHost=172.25.2.234 -v /opt/spdz/Player-Data:/usr/spdz/Player-Data -v /opt/spdz/logs:/usr/spdz/logs -v /opt/spdz/Persistence:/usr/spdz/Persistence spdz/workshop-voting:v0.3.4

