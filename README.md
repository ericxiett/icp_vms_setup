# icp_vms_setup
Setup vms of icp on cp nodes.
# virtinstall.sh has new version
use config driver seed.iso set hostname and ipaddress
Cloud-init version: cloud-init-0.7.9-20.el7.x86_64
version <0.7.9.19   Cloud-init fails to set the default gateway

Usage: sh virtinstall.sh vmname vcpunum memory disk ipaddress netmask gateway
Example: sh virtinstall.sh icpdbs 8 16 500 10.2.7.12 255.255.252.0 10.2.7.254

# virtinstall_v1.sh don't use