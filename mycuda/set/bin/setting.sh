#!/bin/bash
apt-get update 
apt-get install -y curl python3 python3-distutils openssh-server 

curl https://bootstrap.pypa.io/get-pip.py -O get-pip.py
python3 get-pip.py
pip install -r /tmp/requirements.txt

# timezone設定をスキップするための設定(for installing openssh-server)
export DEBIAN_FRONTEND=noninteractive
# settings ssh
apt-get install -y openssh-server 
export mkdir /var/run/sshd
export ENV=NOTVISIBLE "in users profile"
echo "export VISIBLE=now" >> /etc/profile
