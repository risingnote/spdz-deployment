#!/bin/bash
# Convenience script to run and test docker instances spdz engine
# All run from same directory i.e. ~/Development/temp

# Setup
docker run -t --rm -v $(pwd)/Player-Data:/home/spdzuser/spdz/Player-Data spdz/spdz-preprocess 2
# Will need to copy out to each engine...see copy-preprocess.sh

docker run -it --rm -v $(pwd):/home/spdzuser/spdz/keys spdz/spdz-keymaterial
mv SPDZ-Keys Player-Data/2-128-40/Player-SPDZ-Keys-P0
docker run -it --rm -v $(pwd):/home/spdzuser/spdz/keys spdz/spdz-keymaterial
mv SPDZ-Keys Player-Data/2-128-40/Player-SPDZ-Keys-P1

# Container for startup coordination 
docker run -d --name spdz-startup --rm -p 12999:12999 --env parties=2 spdz/spdz-startup

# Container for player 0
docker run -it --rm --name workshop-voting-0 --expose 14010 -p 14010:14010 --expose 14020 -p 14020:14020 --expose 13000 -p 13000:13000 --env playerId=0 --env startupHost=172.21.115.73 -v $(pwd)/Player-Data:/home/spdzuser/spdz/Player-Data -v $(pwd)/logs:/home/spdzuser/spdz/logs spdz/workshop-voting

# Container for player 1
docker run -it --rm --name workshop-voting-1 --expose 14011 -p 14011:14011 --expose 14021 -p 14021:14021 --expose 13001 -p 13001:13001 --env playerId=1 --env startupHost=172.21.115.73 -v $(pwd)/Player-Data:/home/spdzuser/spdz/Player-Data -v $(pwd)/logs:/home/spdzuser/spdz/logs spdz/workshop-voting


# But docker container does not give out meaningful host name.
Player 0 started.
Player 0 is on machine a9bcf9b41c9d
Player 1 started.
Player 1 is on machine 74ab8402bbee