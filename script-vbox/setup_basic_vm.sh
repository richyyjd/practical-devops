#!/bin/bash

#parameters
vmname=$1
ostype="Ubuntu_64"
isofile="/home/rlopez/practical-devops/isos/ubuntu-16.04.3-server-amd64.iso"
memory="1024"
hddsize="8192"
audio="none"

# HDDs
hddfile_root=/home/rlopez/practical-devops/${vmname}/${vmname}_root.vdi
#hddfile_data=/home/rlopez/practical-devops/${vmname}/${vmname}_data.vdi

# Create the VM
#VBoxManage registervm /home/rlopez/practical-devops/${vmname}/${vmname}.vbox
vboxmanage createvm --name $vmname --ostype $ostype --register
vboxmanage modifyvm $vmname --longmode on
 
# memory, network, audio
vboxmanage modifyvm $vmname --memory $memory --acpi on --ioapic on --cpus 1 --cpuexecutioncap 75 --rtcuseutc on --cpuhotplug on --pae on --hwvirtex on
vboxmanage modifyvm $vmname --nic1 bridged --bridgeadapter1 eno1 --cableconnected1 on
vboxmanage modifyvm $vmname --audio $audio
#vboxmanage modifyvm $vmname --vrde on --vrdeport $vrdeport --vrdeauthtype null
 
# HDD, SATA controller
vboxmanage createhd --filename $hddfile_root --size $hddsize
vboxmanage storagectl $vmname --name "SATA controller" --add sata
vboxmanage storageattach $vmname --storagectl "SATA controller" --port 0 --device 0 --type hdd --medium $hddfile_root

#vboxmanage createhd --filename $hddfile_data --size $hddsize
#vboxmanage storagectl $vmname --name "SATA controller 2" --add sata
#vboxmanage storageattach $vmname --storagectl "SATA controller 2" --port 1 --device 1 --type hdd --medium $hddfile_data

# IDE controller, DVD
vboxmanage storagectl $vmname --name "IDE controller" --add ide
vboxmanage storageattach $vmname --storagectl "IDE controller"  --port 0 --device 0 --type dvddrive --medium $isofile
