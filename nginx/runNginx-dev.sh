#!/bin/bash
# Run nginx reverse proxy. Note on dev accessing from local host logs show docker container ip only.
# Extra port mapping to support all docker containers on same host.

docker stop nginx-proxy

docker run --name nginx-proxy --rm -d -v $(pwd)/bankers-dev.conf:/etc/nginx/nginx.conf:ro -v /Users/je0018/temp/logs:/var/log/nginx -v $(pwd)/landingPage:/usr/share/nginx/html -p 8080:80 nginx:1.12.0 
