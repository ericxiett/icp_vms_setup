#!/bin/bash

set -ex

echo "Welcome to setup vms on cp02 node!"

base_path=$(cd `dirname $0`; pwd)
atom_path=$base_path/../

echo "===>>> Prepare env..."
sh $atom_path/prepare_env.sh

echo "===>>> Setup vms..."
echo "======vms: nginx02"
sh  $atom_path/virtinstall.sh  nginx02 8 16 200 10.2.7.12
echo "======vms: console02"
sh  $atom_path/virtinstall.sh  console02 4 8 200 10.2.7.14
echo "======vms: logaudit01"
sh  $atom_path/virtinstall.sh  logaudit01 16 32 1000 10.2.7.37
echo "======vms: inhostmg01"
sh  $atom_path/virtinstall.sh  inhostmg01 8 16 1000 10.2.7.38
echo "======vms: netauto01"
sh  $atom_path/virtinstall.sh  netauto01 4 16 100 10.2.7.39