#!/bin/bash

set -ex

echo "Welcome to setup vms on cp03 node!"

base_path=$(cd `dirname $0`; pwd)
atom_path=$base_path/../

echo "===>>> Prepare env..."
sh $atom_path/prepare_env.sh

echo "===>>> Setup vms..."
echo "======vms: console04"
sh  $atom_path/virtinstall.sh  console04 4 8 200 10.2.7.16 255.255.252.0 10.2.7.254
echo "======vms: crm02"
sh  $atom_path/virtinstall.sh  crm02 4 8 200 10.2.7.18 255.255.252.0 10.2.7.254
echo "======vms: icpmg01"
sh  $atom_path/virtinstall.sh  icpmg01 8 16 200 10.2.7.19 255.255.252.0 10.2.7.254
echo "======vms: jobsche01"
sh  $atom_path/virtinstall.sh  jobsche01 8 16 100 10.2.7.22 255.255.252.0 10.2.7.254
echo "======vms: kafka02"
sh  $atom_path/virtinstall.sh  kafka02 16 32 300 10.2.7.24 255.255.252.0 10.2.7.254
echo "======vms: keycloak01"
sh  $atom_path/virtinstall.sh  keycloak01 4 8 200 10.2.7.30 255.255.252.0 10.2.7.254
echo "======vms: alarm01"
sh  $atom_path/virtinstall.sh  alarm01 16 32 500 10.2.7.35 255.255.252.0 10.2.7.254