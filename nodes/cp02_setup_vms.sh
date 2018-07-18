#!/bin/bash

set -ex

echo "Welcome to setup vms on cp02 node!"

base_path=$(cd `dirname $0`; pwd)
atom_path=$base_path/../atom

echo "===>>> Prepare env..."
sh $atom_path/prepare_env.sh

echo "===>>> Setup vms..."
echo "======vms: nginx02"
sh  $atom_path/virtinstall.sh  nginx02 8 16 200 10.2.7.12 255.255.252.0 10.2.7.254
echo "======vms: console02"
sh  $atom_path/virtinstall.sh  console02 4 8 200 10.2.7.14 255.255.252.0 10.2.7.254
echo "======vms: logaudit01"
sh  $atom_path/virtinstall.sh  logaudit01 16 32 1000 10.2.7.37 255.255.252.0 10.2.7.254
echo "======vms: inhostmg01"
sh  $atom_path/virtinstall.sh  inhostmg01 8 16 1000 10.2.7.38 255.255.252.0 10.2.7.254
echo "======vms: netauto01"
sh  $atom_path/virtinstall.sh  netauto01 4 16 100 10.2.7.39 255.255.252.0 10.2.7.254