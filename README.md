# run-an-ubuntu  
## Usage  
Use root login, then run `wget -q -O - https://raw.githubusercontent.com/RuofengX/run-an-ubuntu/main/oneshot.sh | sh`

## It will ...
- apt update && upgrade
- add safe(normal) user
- ufw firewall  
  - default deny all
  - allow 22/tcp on ipv4 and v6  


- Install docker community engine
- An auto reboot  