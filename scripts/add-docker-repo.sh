#!/bin/bash

distro=$1

case $distro in
ubuntu | debian)
if [ ! -f /usr/share/keyrings/docker-archive-keyring.gpg ] || [ ! -f /etc/apt/sources.list.d/docker.list ]
then
	curl -fsSL https://download.docker.com/linux/$distro/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/$distro $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
else
	echo "GPG key and repository lists already exists"
fi
;;
*)
exit 1
;;
esac
