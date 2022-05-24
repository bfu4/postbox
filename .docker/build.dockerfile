FROM ubuntu:latest

RUN apt update
RUN apt upgrade --yes
RUN apt install sed vim openssh-server --yes

COPY ./scripts/generate-configs /bin/generate-configs
VOLUME ./templates /templates

EXPOSE 22
RUN chpasswd root:toor

RUN chmod +x /bin/generate-configs
RUN service ssh start
