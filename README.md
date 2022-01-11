# run-an-ubuntu  
It is a scriot that run a serious of commond to set uo some basic service.  

## Usage  
Use root login, then run `wget -q -O - https://raw.githubusercontent.com/RuofengX/run-an-ubuntu/main/oneshot.sh | sh`  
A few question will promot, make your own choice!  

## 中国境内使用方法  
切换至root用户，运行`wget -q -O - https://gitee.com/ruofengx/run-a-ubuntu/raw/main/oneshot-cn.sh | sh`  
期间可能会弹出需要输入的问题，请根据自身情况选择。 

## Firewall guide | 防火墙说明  
This script use ufw as firewall manager app, if your want to open new port please use `sudo ufw allow PORT/tcp`  
脚本采用ufw作为防火墙管理程序，使用命令`sudo ufw allow PORT/tcp`来开放更多端口。  
## It will ...
- apt update && upgrade
- add safe(normal) user
- ufw firewall  
  - default deny all
  - allow 22/tcp on ipv4 and v6  
- Install docker community engine & docker-compose
- Add a swapfileto system  
- An auto reboot  

