#!/bin/bash

tag=$1
inventory=$2
playbook=$3

docker run \
--rm -it --network=host \
--name ansible-control-node -e ANSIBLE_HOST_KEY_CHECKING=False \
--mount type=bind,source=$(pwd)/playbooks,target=/data,readonly \
--mount type=bind,source=$(pwd)/inventory,target=/inventory,readonly \
--mount type=bind,source=$HOME/.ssh/id_rsa,target=/tmp/.ssh/id_rsa,readonly \
--mount type=bind,source=$HOME/.ssh/id_rsa.pub,target=/tmp/.ssh/id_rsa.pub,readonly \
darkness1prophet/ansible:$tag ansible-playbook -i /inventory/$2 --private-key /root/.ssh/id_rsa -K $3
