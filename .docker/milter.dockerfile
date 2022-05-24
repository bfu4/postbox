FROM debian:buster-slim

MAINTAINER bfu <bella@localhost22.com>

LABEL milter

ENV HOSTNAME localhost.localdomain
ENV DOMAIN localhost.localdomain

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
 && apt upgrade --yes

RUN apt install --yes --fix-missing \
    ca-certificates \
    opendkim

# This will take like 15 min
RUN opendkim-genkey -s $HOSTNAME -d $DOMAIN -D /etc/dkimkeys
