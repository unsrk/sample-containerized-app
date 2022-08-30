#!/bin/bash
DOCKER_IMAGE=jagadishwar/demo-image
docker pull $DOCKER_IMAGE:$1
docker ps -aq --filter name=webapp | xargs -r docker rm -f
docker run -d --name webapp -p 80:80 $DOCKER_IMAGE:$1
