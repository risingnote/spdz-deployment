#!/bin/bash

docker run -d --name spdz-startup --rm -p 12999:12999 --env parties=3 spdz/spdz-startup:privateclient_2b1cb7