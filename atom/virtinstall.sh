#!/bin/bash
#use config driver seed.iso set hostname and ipaddress
#Cloud-init version: cloud-init-0.7.9-20.el7.x86_64
#version <0.7.9.19   Cloud-init fails to set the default gateway

#Determine parameters 
if [ $# -lt 7 ] 
    then 
        echo "Warning:The script must have seven parameters."
        echo "#########################################################################"
        echo "Usage: sh $0 vmname vcpunum memory disk ipaddress netmask gateway" 
        echo "Example: sh $0 icpdbs 8 16 500 10.2.7.12 255.255.252.0 10.2.7.254"
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
IPADDR=$5
NET_MASK=$6
NET_GATEWAY=$7
DOMAIN="inspurcloud"

get_netdes()
{
#ipaddress
ip1=$(echo $1 | awk -F "." '{print $1}')
ip2=$(echo $1 | awk -F "." '{print $2}')
ip3=$(echo $1 | awk -F "." '{print $3}')
ip4=$(echo $1 | awk -F "." '{print $4}')
#netmask
mask1=$(echo $2 | awk -F "." '{print $1}')
mask2=$(echo $2 | awk -F "." '{print $2}')
mask3=$(echo $2 | awk -F "." '{print $3}')
mask4=$(echo $2 | awk -F "." '{print $4}')

#network number
var=1
var=$[$var+1]
gate1=$(($ip1&$mask1))
gate2=$(($ip2&$mask2))
gate3=$(($ip3&$mask3))
gate4=$(($ip4&$mask4))
echo $gate1.$gate2.$gate3.$gate4
}
#get network number
NET_NUMBER=$(get_netdes ${IPADDR} ${NET_MASK})

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
#disk resize
cp /home/ubuntu/centos73x86_64_cloud-init.qcow2 system.qcow2
#
if [ "${DSIZE}" -le 40 ];then

    echo "The vm disk less 40GB do not resize"
else
    resizenum=$(expr $DSIZE - 40)G
    qemu-img resize system.qcow2 +${resizenum}
fi
#create meta-data file:include hostname
echo "create meta-data..."
{ echo instance-id: iid-${VMNAME}; echo local-hostname: ${VMNAME}; } > meta-data

#create user-data file
printf "#cloud-config\npassword: passw0rd\nchpasswd: { expire: False }\nssh_pwauth: True\n" > user-data

#create network-config file
cat >network-config <<EOF
version: 1
config:
   - type: physical
     name: eth0
     subnets:
        - type: static
          address: ${IPADDR}
          netmask: ${NET_MASK}
          gateway: ${NET_GATEWAY}
          routes:
            - gateway: ${NET_GATEWAY}
              netmask: ${NET_MASK}
              network: ${NET_NUMBER}
          dns_nameservers:
            - 114.114.114.114
            - 8.8.8.8
          dns_search:
            - inspur.cloud            
EOF

#create seed.iso 
echo "create seed.iso ......"
genisoimage  -output seed.iso -volid cidata -joliet -rock user-data meta-data network-config

#create vm
echo "beginning create vm......"   
virt-install --name ${VMNAME}.${DOMAIN}.com --disk path=/var/lib/libvirt/images/${VMNAME}/system.qcow2,bus=virtio,cache=none --disk path=/var/lib/libvirt/images/${VMNAME}/seed.iso --network bridge:br_mgm,model=virtio --ram ${MEM}  --vcpus ${VCPU} --accelerate --boot hd --vnc --vnclisten 0.0.0.0 --noreboot --autostart --import 
sleep 3
#start this vm
virsh start ${VMNAME}.${DOMAIN}.com
#virsh list

virsh list|grep ${VMNAME}.${DOMAIN}.com

if [ $? -eq 0 ];then
	echo "VM:${VMNAME}.${DOMAIN}.com create successful!"
else
    echo "VM:${VMNAME}.${DOMAIN}.com create failure!!"
fi	
