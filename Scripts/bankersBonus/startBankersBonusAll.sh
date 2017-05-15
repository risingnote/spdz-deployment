#!/bin/bash

echo "Run Bankers Bonus SPDZ startup..."
./runSpdzStartup.sh

echo "Start SPDZ Engines..."
ssh spdz-mpc-p0 "/home/je0018/docker/runBankersBonus.sh"
ssh spdz-mpc-p1 "/home/je0018/docker/runBankersBonus.sh"
ssh spdz-mpc-p2 "/home/je0018/docker/runBankersBonus.sh"

echo "Start SPDZ proxies..."
ssh spdz-mpc-p0 "/home/je0018/docker/runBankersBonusProxy.sh"
ssh spdz-mpc-p1 "/home/je0018/docker/runBankersBonusProxy.sh"
ssh spdz-mpc-p2 "/home/je0018/docker/runBankersBonusProxy.sh"

echo "Run Bankers Bonus GUI and REST server..."
./runBankersBonusGui.sh
