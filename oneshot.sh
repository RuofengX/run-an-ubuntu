#!/bin/bash

###
# Config
SWAP_SIZE=4G

###
# Dependence
# Use this if your instance is in china
# sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
apt update
apt --fix-broken install
apt upgrade -y

###
# Enable ufw
apt install ufw -y
ufw default deny
ufw allow 22/tcp
# Use 'ufw allow PORT/tcp' in feature
ufw enable

###
# Install Docker Engine
curl -fsSL https://get.docker.com | bash -s docker
pip3 install docker-compose

###
# Reboot
reboot
