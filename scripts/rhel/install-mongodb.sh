#!/bin/bash

set -e
# we use this data directory for the backward compatibility
# older mup uses mongodb from apt-get and they used this data directory
sudo mkdir -p /var/lib/mongodb

# refresh mongo docker image
docker pull mongo:latest

# remove mongodb docker image if it is present
set +e
docker rm -f mongodb
set -e

# setup mongodb image for local access 
# /var/lib/mongodb is preserved
docker run \
  -d \
  --restart=always \
  --publish=127.0.0.1:27017:27017 \
  --volume=/var/lib/mongodb:/data/db \
  --volume=/opt/mongodb/mongodb.conf:/mongodb.conf \
  --name=mongodb \
  mongo mongod -f /mongodb.conf
