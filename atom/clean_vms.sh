#!/bin/bash

#clean vms 
if [ $# -lt 1 ] 
    then 
        echo -e "Warning:The script must have one parameters."
        echo "#########################################################################"
        echo "Usage: sh $0 vmname" 
        echo  -e "Example: sh $0 icpdbs"
        echo "#########################################################################"
        exit 1
   fi

VMNAME=${1}
SUFFIX=".inspurcloud.com"
VMDIR="/var/lib/libvirt/images/"

result=$(virsh list --all|awk  '{print$2" "$3}'|sed '1,2d'|grep -E "^${VMNAME}")

if [ "$result" = "" ];then
	echo "The ${VMNAME} no exists"
else
    status=$(echo ${result}|awk '{print$2}')
    if [ "$status" = "running" ];then
        virsh destroy ${VMNAME}${SUFFIX}
    fi

    virsh undefine  ${VMNAME}${SUFFIX}
    echo "Delete ${VMNAME} dir and files"
    rm -rf ${VMDIR}/${VMNAME}

fi       
