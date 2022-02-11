FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C

RUN \
	apt-get update && \
	apt-get install --no-install-recommends -y \
		gcc libffi-dev \
		python3 python3-pip libpython3-dev \
		libkrb5-dev krb5-user && \
	rm -rf /var/lib/apt/lists/*

RUN \
	groupadd --gid 2000 admin && useradd -m --uid 2000 --gid 2000 admin

USER admin:admin
ENV PATH "/home/admin/.local/bin:$PATH"

RUN \
	python3 -m pip install --upgrade virtualenv pywinrm[kerberos] pywinrm

ARG ANSIBLE_VERSION=latest
RUN \
	if [ "$ANSIBLE_VERSION" = "latest" ] ; then \
		python3 -m pip install ansible ; \
	else \
		python3 -m pip install ansible==$ANSIBLE_VERSION ; \
	fi

ENTRYPOINT ["ansible"]
CMD ["--help"]

