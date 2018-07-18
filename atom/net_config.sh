#!/bin/bash
#network config
#Instructions:Network mode is set according to binding mode

#init info
#bond_mode value:1,4 or no
#OS Platform:Ubuntu

bond_mode="1" 
bond_interface1="eno1"
bond_interface2="eno2"

#set_node_ctl
ip_address="10.2.16."
ip_netmask="255.255.240.0"
ip_gateway="10.2.31.254"
ipnum=$(ip a|grep '10.2.'|awk '{print$2}'|cut -d'.' -f4|cut -d'/' -f1)
#ipnum="6"
##bond interface
#sed -i "/^auto ${bond_interface1}/,+2d" /etc/network/interfaces 
#sed -i "/^auto ${bond_interface2}/,+2d" /etc/network/interfaces
##modify interfaces file

if [[ ${bond_mode}x == "4"x ]];	then

cat >/etc/network/interfaces <<EOF
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface

auto lo
iface lo inet loopback

auto ${bond_interface1}
iface ${bond_interface1} inet manual
    bond-master bond0
    
auto ${bond_interface2}
iface ${bond_interface2} inet manual
    bond-master bond0 

auto bond0
iface bond0 inet manual
    mtu 1500
    bond-ad_select 0
    bond-downdelay 200
    bond-lacp_rate 0
    bond-miimon 100
    bond-mode 4
    bond-slaves ${bond_interface1} ${bond_interface2}
    bond-updelay 0
    bond-use_carrier on

auto br_mgm
iface br_mgm inet static
    address ${ip_address}${ipnum}
    netmask ${ip_netmask}
    gateway ${ip_gateway}
    dns-nameservers 223.5.5.5 114.114.114.114 
    bridge_ports bond0   
EOF
   elif [[ ${bond_mode}x == "1"x ]]; then
cat >/etc/network/interfaces <<EOF
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface

auto lo
iface lo inet loopback
auto ${bond_interface1}
iface ${bond_interface1} inet manual
    bond-master bond0
    
auto ${bond_interface2}
iface ${bond_interface2} inet manual
    bond-master bond0 

auto bond0
iface bond0 inet manual
    mtu 1500
    bond-lacp_rate slow
    bond-miimon 100
    bond-mode 1
    bond-slaves none

auto br_mgm
iface br_mgm inet static
    address ${ip_address}${ipnum}
    netmask ${ip_netmask}
    gateway ${ip_gateway}
    dns-nameservers 223.5.5.5 114.114.114.114 
    bridge_ports bond0    
EOF
fi

ifdown ${bond_interface1} && ifup ${bond_interface1}
ifdown ${bond_interface2} && ifup ${bond_interface2}

#systemctl restart networking
##waiting network 
sleep 10
