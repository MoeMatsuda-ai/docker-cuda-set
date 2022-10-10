#!/bin/bash

apt-get update 
apt-get install -y curl python3 python3-distutils openssh-server 

curl https://bootstrap.pypa.io/get-pip.py -O get-pip.py
python3 get-pip.py
pip install -r /tmp/requirements.txt
