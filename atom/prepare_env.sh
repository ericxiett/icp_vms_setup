#!/bin/bash


#Determine qemu-utils tools install
dpkg -l|grep -E "qemu-utils|virtinst"|awk '{print$2}'|grep -E "^qemu-utils|^virtinst"

if [ $? -eq 0 ];then
	echo "The qemu-utils tools already installed"
else
    apt-get install qemu-utils -y

#Determine virtinst tools install
dpkg -l|grep -E "virtinst"|awk '{print$2}'|grep -E "^virtinst"
if [ $? -eq 0 ];then
	echo "The virtinst tools already installed"
else
    apt-get install virtinst -y

#Determine libguestfs-tools tools install
dpkg -l|grep -E "libguestfs-tools"|awk '{print$2}'|grep -E "^libguestfs-tools"
if [ $? -eq 0 ];then
	echo "The libguestfs-tools  already installed"
else
    apt-get install libguestfs-tools -y   
