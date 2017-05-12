#!/bin/bash
# Run nginx reverse proxy.
# Note that proxy_pass will be sending forwards out with docker bridge network IPs (172.17.0), if firewall needs openning.

docker run --name nginx-proxy --rm -d -p 443:443 -v /opt/spdz/nginx/nginx.conf:/etc/nginx/nginx.conf:ro -v /opt/spdz/logs:/var/log/nginx -v /opt/spdz/certs:/etc/certs nginx:1.12.0
