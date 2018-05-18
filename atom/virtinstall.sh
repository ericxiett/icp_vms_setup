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
#virt-install \
#    --name rhel5.8
#    --ram 512
#    --disk /VMs/rhel5.8.img
#    --import

cd ${WORKDIR}
if [ -d  "${VMNAME}" ];then
	echo "The vm ${VMNAME} dir already exists"
else
	mkdir ${VMNAME}
	echo "The vm ${VMNAME} created successful"
fi	

cd ${VMNAME}

cp /var/lib/libvirt/images/centos73x86_64.qcow2 system.qcow2
#disk size
if [ "${DSIZE}" -le 40 ];then

    echo "The vm disk less 40GB do not resize"
else
	resizenum=$(expr $DSIZE - 40)G
    qemu-img resize system.qcow2 +${resizenum}
fi	

#create vm

virt-install --name ${VMNAME}.inspurcloudtest.com --disk path=/var/lib/libvirt/images/${VMNAME}/system.qcow2,bus=virtio,cache=none --network bridge:br_mgm,model=virtio --ram ${MEM}  --vcpus ${VCPU} --accelerate --boot hd --vnc -vnclisten 0.0.0.0 --noreboot --autostart --import 

#virsh list

virsh start ${VMNAME}.inspurcloudtest.com
virsh list
