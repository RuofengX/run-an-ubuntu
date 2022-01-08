###
# Var
timeout='1h'

###
# Dependence
# Use this if your instance is in china
# sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
apt update
apt --fix-broken install
apt install screen

###
# Screen daemon
screen_name="start_ubuntu_helper"
dir_here=$(pwd)
screen -dms $screen_name
screen -x -S $screen_name -p 0 -X stuff "sh $dir_here/long-run.sh"
screen -x -S $screen_name -p 0 -X stuff "\n"

###
# Timeout
sleep $timeout

###
# Vanish daemon
screen -x -S $screen_name -p 0 -X stuff "exit"
screen -x -S $screen_name -p 0 -X stuff "\n"