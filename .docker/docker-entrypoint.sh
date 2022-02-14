#!/bin/bash

if [ -d "/tmp/.ssh" ]
then
    mkdir -p /root/.ssh
    chmod 0700 /root/.ssh
    cp /tmp/.ssh/id_rsa /tmp/.ssh/id_rsa.pub /root/.ssh
    chmod 0600 /root/.ssh/id_rsa
    chmod 0644 /root/.ssh/id_rsa.pub
fi

TOOL=$1
if [ -z "$1" ]
then
    "$HOME/.local/bin/ansible" --help
elif [ -f "$HOME/.local/bin/$TOOL" ]
then
    "$HOME/.local/bin/$TOOL" "${@: 2}"
elif [ -f "$HOME/.local/bin/ansible-$TOOL" ]
then
    "$HOME/.local/bin/ansible-$TOOL" "${@: 2}"
else
    echo "No ansible tool '$TOOL'"
fi
