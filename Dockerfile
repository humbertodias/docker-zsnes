FROM ubuntu:20.04

RUN dpkg --add-architecture i386 && apt update && apt -y upgrade && DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y zsnes

ARG USER=docker
ARG UID=1000
ARG GID=1000
# default password for user
ARG PW=docker

# Option1: Using unencrypted password/ specifying password
RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | chpasswd && adduser docker sudo

# Setup default user, when enter docker container
USER ${UID}:${GID}
WORKDIR /home/${USER}

CMD zsnes