#!/bin/bash

docker run -d --name bankers-bonus-spdz-startup --rm -p 12999:12999 --env parties=3 spdz/spdz-startup

