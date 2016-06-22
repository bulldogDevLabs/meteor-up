#!/bin/bash

# docker rhel install info
# https://docs.docker.com/engine/installation/linux/rhel/
 
# Required to update system
sudo yum update -y

# Install docker
sudo yum install docker-engine -y
sudo service docker start
