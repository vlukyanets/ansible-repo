#!/bin/bash

distro=$1

case $distro in
ubuntu | debian)
if [ -f /usr/share/keyrings/docker-archive-keyring.gpg ]
then
    rm /usr/share/keyrings/docker-archive-keyring.gpg
    echo "GPG key deleted"
fi

if [ -f /etc/apt/sources.list.d/docker.list ]
then
    rm /etc/apt/sources.list.d/docker.list
    echo "Docker repository deleted"
fi
;;
*)
exit 1
;;
esac
