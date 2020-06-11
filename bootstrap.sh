#!/usr/bin/env bash

# install docker
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-get update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker

sudo usermod -aG docker ${USER}
su - ${USER}

