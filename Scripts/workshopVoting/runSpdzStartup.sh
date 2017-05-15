#!/bin/bash

docker run -d --name spdz-startup --rm -p 13099:12999 --env parties=3 spdz/spdz-startup

