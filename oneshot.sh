#!/bin/bash

###
# Config
SWAP_SIZE=4G

###
# Dependence
# Use this if your instance is in china
# sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
apt update
apt install --fix-broken 
apt upgrade -y

###
# Enable ufw
apt install ufw -y
ufw default deny
ufw allow 22/tcp
# Use 'ufw allow PORT/tcp' in feature
ufw enable


###
# Swapfile
if test -z "$(swapon --show)"; then
    fallocate -l $SWAP_SIZE /swapfile
    chmod 600 /swapfile
    mkswap /swapfile
    swapon /swapfile
    # Backup and update fstab file to auto mount swapfile
    cp /etc/fstab /etc/fstab.noswap
    echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab
    # Optimize some config make swap more efficient
    sysctl vm.swappiness=10
    sysctl vm.vfs_cache_pressure=50
fi
swapon --show


###
# Install Docker Engine and Compose
curl -fsSL https://get.docker.com | bash -s docker
curl -L "https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

###
# Reboot
reboot
