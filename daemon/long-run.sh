###
# Upgrade all
apt upgrade -y

###
# Install UFW
apt install ufw -y
ufw default deny
ufw allow 22/tcp
# Use 'ufw allow PORT/tcp' in feature
ufw enable

###
# Install Docker Engine
curl -fsSL https://get.docker.com | bash -s docker
# If your instance is in China, use this mirror instead:
# curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

###
# Reboot
reboot
