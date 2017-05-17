#!/bin/bash

HERE=$(cd `dirname $0`; pwd)

echo "Start remote nginx proxies..."
ssh spdz-mpc-p0 "/home/je0018/docker/runNginx.sh"
ssh spdz-mpc-p1 "/home/je0018/docker/runNginx.sh"
ssh spdz-mpc-p2 "/home/je0018/docker/runNginx.sh"

echo "Start local nginx proxy..."
$HERE/runNginx.sh

