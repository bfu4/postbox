FROM debian:buster-slim

MAINTAINER bfu <bella@localhost22.com>

LABEL mail

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
 && apt upgrade --yes \
 && apt install --yes \
        net-tools \
	ca-certificates \
	ufw \
	certbot

RUN apt install --yes postfix
