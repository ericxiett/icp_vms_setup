#!/bin/bash

set -ex

echo "Welcome to setup vms on cp06 node!"

base_path=$(cd `dirname $0`; pwd)
atom_path=$base_path/../

echo "===>>> Prepare env..."
sh $atom_path/prepare_env.sh

echo "===>>> Setup vms..."
echo "======vms: cpdbs02"
sh  $atom_path/virtinstall.sh  cpdbs02 16 32 2000 10.2.7.27
echo "======vms: keycloak03"
sh  $atom_path/virtinstall.sh  keycloak03 4 8 200 10.2.7.32
echo "======vms: k8sdeploy02"
sh  $atom_path/virtinstall.sh  k8sdeploy02 4 8 200 10.2.7.34