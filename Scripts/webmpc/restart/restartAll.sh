#!/bin/bash
# Schedule to run nightly to fix demos breaking because of docker upgrades and broken sockets.
# Assumes docker is running as it is a started service.
# Run as cron from this user (requires docker access and authorized ssh keys setup).
# 30 5 * * * /home/je0018/docker/restart/restartAll.sh >> /home/je0018/docker/restart/restart.log 2>&1

HERE=$(cd `dirname $0`; pwd)

echo "Restart MPC deployed docker containers at"  `date '+%Y-%m-%d %H:%M:%S'`

echo "Stop all docker processes..."
$HERE/../nginx/stopNginxAll.sh
$HERE/../workshopVoting/stopWorkShopVotingAll.sh
$HERE/../bankersBonus/stopBankersBonusAll.sh

echo "Start all docker processes..."
$HERE/../bankersBonus/startBankersBonusAll.sh
$HERE/../workshopVoting/startWorkShopVotingAll.sh
$HERE/../nginx/startNginxAll.sh

echo "Finished at" `date '+%Y-%m-%d %H:%M:%S'`