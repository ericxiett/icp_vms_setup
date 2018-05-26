#!/bin/bash

set -ex

echo "Welcome to setup vms on cp03 node!"

base_path=$(cd `dirname $0`; pwd)
atom_path=$base_path/../

echo "===>>> Prepare env..."
sh $atom_path/prepare_env.sh

echo "===>>> Setup vms..."
echo "======vms: console03"
sh  $atom_path/virtinstall.sh  console03 4 8 200 10.2.7.15 255.255.252.0 10.2.7.254
echo "======vms: crm01"
sh  $atom_path/virtinstall.sh  crm01 4 8 200 10.2.7.17 255.255.252.0 10.2.7.254
echo "======vms: cpdbs01"
sh  $atom_path/virtinstall.sh  cpdbs01 16 32 2000 10.2.7.26 255.255.252.0 10.2.7.254
echo "======vms: redis02"
sh  $atom_path/virtinstall.sh  redis02 2 8 200 10.2.7.29 255.255.252.0 10.2.7.254
echo "======vms: alarm02"
sh  $atom_path/virtinstall.sh  alarm02 16 32 500 10.2.7.36 255.255.252.0 10.2.7.254