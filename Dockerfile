FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C

RUN \
	apt-get update && \
	apt-get install --no-install-recommends -y \
		gcc libffi-dev openssh-client sshpass \
		python3 python3-pip libpython3-dev \
		libkrb5-dev krb5-user && \
	rm -rf /var/lib/apt/lists/*

RUN \
	groupadd --gid 2000 admin && useradd -m --uid 2000 --gid 2000 admin

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

USER admin:admin
ENV PATH "/home/admin/.local/bin:$PATH"

RUN \
	python3 -m pip install --user --upgrade pywinrm[kerberos] pywinrm

ARG ANSIBLE_VERSION=latest
RUN \
	if [ "$ANSIBLE_VERSION" = "latest" ] ; then \
		python3 -m pip install --user ansible ; \
	else \
		python3 -m pip install --user ansible==$ANSIBLE_VERSION ; \
	fi

WORKDIR /data
ENTRYPOINT ["/docker-entrypoint.sh"]
