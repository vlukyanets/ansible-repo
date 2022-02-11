#!/bin/sh

if [[ -z $1 ]] ; then
	docker build . -t ansible:latest
else
	docker build . -t ansible:v$1 --build-arg ANSIBLE_VERSION=$1
fi
