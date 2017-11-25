#!/bin/bash
docker run --name cloudera \
  --hostname=quickstart.cloudera \
  --privileged=true -t -d \
  -p 8888:8888 \
  -p 7180:7180 \
  -p 80:80 \
  -p 7187:7187 \
  -p 8079:8079 \
  -p 8400:8400 \
  -p 8161:8161 \
  cloudera/quickstart:5.7.0-0-beta /usr/bin/docker-quickstart
