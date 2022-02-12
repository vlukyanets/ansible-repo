#!/bin/bash

if [[ -z $1 ]] ; then
	docker build . -t darkness1prophet/ansible:latest
else
	docker build . -t darkness1prophet/ansible:v$1 --build-arg ANSIBLE_VERSION=$1
fi
