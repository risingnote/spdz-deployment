#!/bin/bash
# Run nginx reverse proxy on web-mpc-p0 (mpc.cs.bris.ac.uk).

docker run --name nginx-proxy --rm -d --network=spdz_nw -p 443:443 -v /opt/spdz/nginx/nginx.conf:/etc/nginx/nginx.conf:ro -v /opt/spdz/logs:/var/log/nginx -v /opt/spdz/certs:/etc/certs:ro -v /opt/spdz/nginx/landingPage:/usr/share/nginx/html:ro nginx:1.12.0
