#!/bin/bash

###
# Config
SWAP_SIZE=4G

###
# Dependence
# Use this if your instance is in china
sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
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
# Install Docker Engine
#curl -fsSL https://get.docker.com | bash -s docker
# If your instance is in China, use this mirror instead:
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
pip3 install docker-compose
# Change docker source to fast mirror
echo '{
  "registry-mirrors": [
    "https://hub-mirror.c.163.com",
    "https://ustc-edu-cn.mirror.aliyuncs.com",
    "https://ghcr.io",
    "https://mirror.baidubce.com"
  ]
}' > /etc/docker/daemon.json
systemctl restart docker

###
# Install Docker Engine and Compose
curl -fsSL https://get.docker.com | bash -s docker
curl -L "https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

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
# Reboot
reboot
