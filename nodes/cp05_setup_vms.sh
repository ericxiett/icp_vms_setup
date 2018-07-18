#!/bin/bash

set -ex

echo "Welcome to setup vms on cp05 node!"

base_path=$(cd `dirname $0`; pwd)
atom_path=$base_path/../atom

echo "===>>> Prepare env..."
sh $atom_path/prepare_env.sh

echo "===>>> Setup vms..."
echo "======vms: icpmg02"
sh  $atom_path/virtinstall.sh  icpmg02 8 16 200 10.2.7.20 255.255.252.0 10.2.7.254
echo "======vms: collect01"
sh  $atom_path/virtinstall.sh  collect01 16 32 500 10.2.7.21 255.255.252.0 10.2.7.254
echo "======vms: kafka01"
sh  $atom_path/virtinstall.sh  kafka01 16 32 300 10.2.7.23 255.255.252.0 10.2.7.254
echo "======vms: keycloak02"
sh  $atom_path/virtinstall.sh  keycloak02 4 8 200 10.2.7.31 255.255.252.0 10.2.7.254
echo "======vms: k8sdeploy01"
sh  $atom_path/virtinstall.sh  k8sdeploy01 4 8 200 10.2.7.33 255.255.252.0 10.2.7.254