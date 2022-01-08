###
# Var
timeout='1h'
safe_user_name='ubuntu'
echo "Please enter a password for safe(normal) user:"
safe_user_passwd=$(read)

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
# If your instance is in China, use this mirror instead:
# curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

###
# Add safe(normal) user
useradd -d /home/$safe_user_name -s /bin/bash -m $safe_user_name
chpasswd $safe_user_name:$safe_user_passwd

###
# SSH-related
cd /home/$safe_user_name
ssh-keygen
##TODO

###
# Reboot
reboot
