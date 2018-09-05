#!/bin/bash
sudo su << EOF
echo "Step 1"
echo "======="
wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -

echo "Step 2"
echo "======="
echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" >> /etc/apt/sources.list.d/saltstack.list
#deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main

echo "Step 3"
echo "======="
sudo apt-get update

echo "Step 4"
echo "======="
sudo apt-get -y install salt-master salt-minion salt-ssh

echo "Step 5"
echo "======="
echo "master: localhost" >> /etc/salt/minion.d/local.conf
echo "id: salt-master" >> /etc/salt/minion.d/local.conf

echo "Step 6"
echo "======="
#cd /etc/salt/
sudo rm /etc/salt/minion_id
sudo sed -i 's/#auto_accept: False/auto_accept: True/g' /etc/salt/master
sudo systemctl restart salt-minion
sudo salt-key -A

EOF
