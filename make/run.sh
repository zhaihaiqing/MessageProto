#!/bin/sh

PROGRAM_VERSION=v1.0.0

docker rm BStack2Proto3
docker rmi docker-registry.thunics.org:5000/bstack2proto3:${PROGRAM_VERSION}

mkdir .output
docker pull docker-registry.thunics.org:5000/bstack2proto3:${PROGRAM_VERSION}
docker run -it --name BStack2Proto3 -v $PWD/MessageProto:/home/work/bstack2proto3/MessageProto -v $PWD/wsn-data:/home/work/bstack2proto3/wsn-data -v $PWD/.output:/home/work/bstack2proto3/output docker-registry.thunics.org:5000/bstack2proto3:${PROGRAM_VERSION} /home/work/bstack2proto3/BStack2Proto3.sh

