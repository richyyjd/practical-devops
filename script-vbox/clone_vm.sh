#!/bin/bash
# How to use:
# ./clone_vm.sh <NAME_FOR_NEW_VM>
echo "Example to use: ./clone_vm.sh <NAME_FOR_NEW_VM>"
NAME=$1
vboxmanage clonevm ub-server-base --name $NAME --register
