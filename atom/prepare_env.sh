#!/bin/bash


#Determine qemu-utils tools install
dpkg -l|grep -E "qemu-utils|virtinst"|awk '{print$2}'|grep -E "^qemu-utils|^virtinst"

if [ $? -eq 0 ];then
	echo "The qemu-utils tools already installed"
else
    apt-get install qemu-utils -y
fi
#Determine virtinst tools install
dpkg -l|grep -E "virtinst"|awk '{print$2}'|grep -E "^virtinst"
if [ $? -eq 0 ];then
	echo "The virtinst tools already installed"
else
    apt-get install virtinst -y
fi
#Determine libguestfs-tools tools install
#dpkg -l|grep -E "libguestfs-tools"|awk '{print$2}'|grep -E "^libguestfs-tools"
#if [ $? -eq 0 ];then
#	echo "The libguestfs-tools  already installed"
#else
#   apt-get install libguestfs-tools -y
#fi

#Determine genisoimage tools install 
dpkg -l|grep -E "genisoimage"|awk '{print$2}'|grep -E "^genisoimage"
if [ $? -eq 0 ];then
	echo "The genisoimage tools already installed"
else
    apt-get install genisoimage -y
fi