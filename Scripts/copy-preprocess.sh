#!/bin/bash
# After running Dockerfile-spdz-preprocess to generate offline material 
# send to a host storing in /usr/spdz/preprocess
# Assumes .ssh/config setup with Host and IdentityFile
#
# e.g. Scripts/copy-preprocess.sh party-num ipaddress
PARTY_NUM=$1
IP_ADDRESS=$2

ssh root@$IP_ADDRESS 'mkdir -p /usr/spdz/preprocess'

scp -r Player-Data/*/*-P$PARTY_NUM root@$IP_ADDRESS:/usr/spdz/preprocess
