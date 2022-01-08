# run-an-ubuntu  
It is a scriot that run a serious of commond to set uo some basic service.  

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

## TODO  
Any help is needed!
- ssh-keygen, echo the key file/or type in key
