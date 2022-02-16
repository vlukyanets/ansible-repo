#!/bin/bash

if [ ! -f /usr/share/keyrings/docker-archive-keyring.gpg ] || [ ! -f /etc/apt/sources.list.d/docker.list ]
then
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
else
	echo "GPG key and repository lists already exists"
fi
