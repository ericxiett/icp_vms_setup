#!/bin/bash

#create vm use virt-install




if [ $# -lt 4 ] 
    then 
        echo -e "Warning:The script must have four parameters."
        echo "#########################################################################"
        echo "Usage: sh $0 vmname vcpunum memory disk" 
        echo  -e "Example: sh $0 icpdbs 8 16 500"
        echo "#########################################################################"
        exit 1
    else
        echo "Will create ${1} vm"    
   fi  


WORKDIR="/var/lib/libvirt/images/"
VMNAME=$1
VCPU=$2
MEM=$(expr $3 \* 1024)
DSIZE=$4

#Determine if the virtual machine exists
echo "Determine if the virtual machine exists"
virsh list --all|awk  '{print$2}'|sed '1,2d'|grep -E "^${VMNAME}"
if [ $? -eq 0 ];then
    echo "The ${VMNAME} already exists"
    exit 1
fi

cd ${WORKDIR}
if [ -d  "${VMNAME}" ];then
	echo "The vm ${VMNAME} dir already exists"
else
	mkdir ${VMNAME}
	echo "The vm ${VMNAME} created successful"
fi	

cd ${VMNAME}

cp /home/ubuntu/centos72x86_64_cloud-init.qcow2 system.qcow2

if [ "${DSIZE}" -le 40 ];then

    echo "The vm disk less 100GB do not resize"
else
	resizenum=$(expr $DSIZE - 40)G
    qemu-img resize system.qcow2 +${resizenum}
fi	

#disk size

virt-install --name ${VMNAME}.inspurcloud.com --disk path=/var/lib/libvirt/images/${VMNAME}/system.qcow2,bus=virtio,cache=none --network bridge:br_mgm,model=virtio --ram ${MEM}  --vcpus ${VCPU} --accelerate --boot hd --vnc --vnclisten 0.0.0.0 --noreboot --autostart --import 
virsh start ${VMNAME}.inspurcloud.com
#virsh list
virsh list
