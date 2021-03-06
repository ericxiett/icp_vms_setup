#!/bin/bash

set -ex

echo "Welcome to setup vms on cp01 node!"

base_path=$(cd `dirname $0`; pwd)
atom_path=$base_path/../atom

echo "===>>> Prepare env..."
sh $atom_path/prepare_env.sh

echo "===>>> Setup vms..."
echo "======vms: nginx01"
sh  $atom_path/virtinstall.sh  nginx01 8 16 200 10.2.7.11 255.255.252.0 10.2.7.254
echo "======vms: console01"
sh  $atom_path/virtinstall.sh  console01 4 8 200 10.2.7.13 255.255.252.0 10.2.7.254
echo "======vms: frontend01"
sh  $atom_path/virtinstall.sh  frontend01 4 8 200 10.2.7.25 255.255.252.0 10.2.7.254
echo "======vms: redis01"
sh  $atom_path/virtinstall.sh  redis01 2 8 200 10.2.7.28 255.255.252.0 10.2.7.254


