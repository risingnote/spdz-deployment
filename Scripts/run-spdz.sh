#!/bin/bash
# Convenience script to run and test docker instances spdz engine
# All run from same directory i.e. ~/Development/temp

# Setup
# docker run -t --rm -v $(pwd)/Player-Data:/home/spdzuser/spdz/Player-Data spdz/spdz-preprocess 2
# Will need to copy out to each engine...see copy-preprocess.sh

# docker run -it --rm -v $(pwd):/home/spdzuser/spdz/keys spdz/spdz-keymaterial
# mv SPDZ-Keys Player-Data/2-128-40/Player-SPDZ-Keys-P0
# docker run -it --rm -v $(pwd):/home/spdzuser/spdz/keys spdz/spdz-keymaterial
# mv SPDZ-Keys Player-Data/2-128-40/Player-SPDZ-Keys-P1

#/etc/hosts mappings to substitute without escaped quote messing up docker cmd - wtf
hostMappings='--add-host "spdz-startup spdz-party-0 spdz-party-1":192.168.1.80'

#############################################################################
# Running on 1 host
#############################################################################
# Container for startup coordination 
docker run -d --name spdz-startup --rm -p 12999:12999 --env parties=2 spdz/spdz-startup

# When running on single host use host ip address or docker bridge network ip (172.17.0.2) for startupHost.
# Server.x collects docker bridge network ips 172.17.0.0)
docker run -d --rm --name workshop-voting-0 --expose 14000 -p 14000:14000 --expose 13000 -p 13000:13000 --env playerId=0 --env startupHost=172.21.114.252 -v /Users/je0018/Development/spdz/Player-Data:/usr/spdz/Player-Data -v $(pwd)/logs:/usr/spdz/logs spdz/workshop-voting:v0.3.0

docker run -d --rm --name workshop-voting-1 --expose 14001 -p 14001:14001 --expose 13001 -p 13001:13001 --env playerId=1 --env startupHost=172.21.114.252 -v /Users/je0018/Development/spdz/Player-Data:/usr/spdz/Player-Data -v $(pwd)/logs:/usr/spdz/logs spdz/workshop-voting:v0.3.0

#############################################################################
# Running on Digital Ocean droplets
#############################################################################
docker run -d --name spdz-startup --rm -p 12999:12999 --env parties=3 spdz/spdz-startup:privateclient_2b1cb7

docker run -d --rm --name workshop-voting-0 --expose 14000 -p 14000:14000 --expose 13000 -p 13000:13000 --env playerId=0 --env startupHost=172.25.2.234 -v /root/spdz/Player-Data:/home/spdzuser/spdz/Player-Data -v /root/spdz/logs:/home/spdzuser/spdz/logs spdz/workshop-voting:privateclient_2b1cb7

docker run -d --rm --name workshop-voting-1 --expose 14001 -p 14001:14001 --expose 13001 -p 13001:13001 --env playerId=1 --env startupHost=172.25.2.234 -v /root/spdz/Player-Data:/home/spdzuser/spdz/Player-Data -v /root/spdz/logs:/home/spdzuser/spdz/logs spdz/workshop-voting:privateclient_2b1cb7

docker run -d --rm --name workshop-voting-2 --expose 14002 -p 14002:14002 --expose 13002 -p 13002:13002 --env playerId=2 --env startupHost=172.25.2.234 -v /root/spdz/Player-Data:/home/spdzuser/spdz/Player-Data -v /root/spdz/logs:/home/spdzuser/spdz/logs spdz/workshop-voting:privateclient_2b1cb7
