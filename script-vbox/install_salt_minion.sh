#!/bin/bash

sudo su << EOF
echo "STEP 1"
echo "======="
sudo add-apt-repository ppa:saltstack/salt
sudo apt-get update
sudo apt-get install salt-minion

echo "STEP 2"
echo "======="
echo "master: 192.168.1.12" >> /etc/salt/minion

echo "STEP 3"
echo "======="
systemctl restart salt-minion
salt-call key.finger --local

echo "-- FIN --"
EOF
