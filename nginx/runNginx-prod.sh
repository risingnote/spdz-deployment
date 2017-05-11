#!/bin/bash
# Run nginx reverse proxy.

docker stop nginx-proxy

docker run --name nginx-proxy --rm -d -p 443:443 -v /opt/spdz/nginx/exampleProxy.conf:/etc/nginx/nginx.conf:ro -v /opt/spdz/logs:/var/log/nginx -v /opt/spdz/certs:/etc/certs nginx:1.12.0
