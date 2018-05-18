#!/bin/bash

set -ex

echo "Welcome to setup vms on cp01 node!"

base_path=$(cd `dirname $0`; pwd)
atom_path=$base_path/../

echo "===>>> Prepare env..."
sh $atom_path/prepare_env.sh

echo "===>>> Setup vms..."
echo "======vms: nginx01"
sh $atom_path/virtinstall.sh nginx01 8 16 200
