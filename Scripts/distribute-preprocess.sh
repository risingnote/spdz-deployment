#!/bin/bash
# Generate fake offline material and distribute to parties. 
# Assumes .ssh/config setup with Host and IdentityFile

if test -d Player-Data; then
    rm -fr Player-Data
fi
mkdir Player-Data

# Add -u `id -u $USER` on linux
docker run -t --rm -v $(pwd)/Player-Data:/home/spdzuser/spdz/Player-Data spdz/spdz-preprocess 3

ssh mpcalice "mkdir -p /home/je0018/spdz/Player-Data/3-128-40"
scp -r Player-Data/3-128-40/*-P0 mpcalice:/home/je0018/spdz/Player-Data/3-128-40
scp -r Player-Data/3-128-40/Inputs*P0* mpcalice:/home/je0018/spdz/Player-Data/3-128-40
scp -r Player-Data/3-128-40/Params-Data mpcalice:/home/je0018/spdz/Player-Data/3-128-40

ssh mpcbob "mkdir -p /home/je0018/spdz/Player-Data/3-128-40"
scp -r Player-Data/3-128-40/*-P1 mpcbob:/home/je0018/spdz/Player-Data/3-128-40
scp -r Player-Data/3-128-40/Inputs*P1* mpcbob:/home/je0018/spdz/Player-Data/3-128-40
scp -r Player-Data/3-128-40/Params-Data mpcbob:/home/je0018/spdz/Player-Data/3-128-40

ssh mpccarol "mkdir -p /home/je0018/spdz/Player-Data/3-128-40"
scp -r Player-Data/3-128-40/*-P2 mpccarol:/home/je0018/spdz/Player-Data/3-128-40
scp -r Player-Data/3-128-40/Inputs*P2* mpccarol:/home/je0018/spdz/Player-Data/3-128-40
scp -r Player-Data/3-128-40/Params-Data mpccarol:/home/je0018/spdz/Player-Data/3-128-40
