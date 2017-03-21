#!/bin/bash
# Generate fake offline material and distribute to parties. 
# Assumes .ssh/config setup with Host and IdentityFile

mkdir Player-Data

docker run -t --rm -v $(pwd)/Player-Data:/home/spdzuser/spdz/Player-Data spdz/spdz-preprocess 3

ssh root@spdzalice "mkdir -p /root/spdz/Player-Data/3-128-40 && mkdir -p /root/spdz/logs && chmod -R 777 /root/spdz"
scp -r Player-Data/3-128-40/*-P0 root@spdzalice:/root/spdz/Player-Data/3-128-40
scp -r Player-Data/3-128-40/Inputs*P0* root@spdzalice:/root/spdz/Player-Data/3-128-40
scp -r Player-Data/3-128-40/Params-Data root@spdzalice:/root/spdz/Player-Data/3-128-40

ssh root@spdzbob "mkdir -p /root/spdz/Player-Data/3-128-40 && mkdir -p /root/spdz/logs && chmod -R 777 /root/spdz"
scp -r Player-Data/3-128-40/*-P1 root@spdzbob:/root/spdz/Player-Data/3-128-40
scp -r Player-Data/3-128-40/Inputs*P1* root@spdzbob:/root/spdz/Player-Data/3-128-40
scp -r Player-Data/3-128-40/Params-Data root@spdzbob:/root/spdz/Player-Data/3-128-40

ssh root@spdzcarol "mkdir -p /root/spdz/Player-Data/3-128-40 && mkdir -p /root/spdz/logs && chmod -R 777 /root/spdz"
scp -r Player-Data/3-128-40/*-P2 root@spdzcarol:/root/spdz/Player-Data/3-128-40
scp -r Player-Data/3-128-40/Inputs*P2* root@spdzcarol:/root/spdz/Player-Data/3-128-40
scp -r Player-Data/3-128-40/Params-Data root@spdzcarol:/root/spdz/Player-Data/3-128-40
