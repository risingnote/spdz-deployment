#!/bin/bash
# Run at startup to coordinate spdz engines.

docker run -d --name spdz-startup --rm -p 12999:12999 --env parties=3 spdz/spdz-startup