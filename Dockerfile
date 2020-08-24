FROM ubuntu:20.04

RUN dpkg --add-architecture i386 && apt update && apt -y upgrade && DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y zsnes sudo curl unzip build-essential scanmem xterm

# Memdig
RUN cd /tmp && mkdir memdig && cd memdig && \
    curl -k -s https://codeload.github.com/humbertodias/memdig/zip/master -o memdig.zip && \
    unzip -j memdig.zip && \
    make -f Makefile.linux && cp memdig /usr/local/bin

ARG USER=docker
ARG UID=1000
ARG GID=1000
# default password for user
ARG PW=docker

# Option1: Using unencrypted password/ specifying password
RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | chpasswd \
&& adduser docker sudo \ 
&& sed -i /etc/sudoers -re 's/^%sudo.*/%sudo ALL=(ALL:ALL) NOPASSWD: ALL/g'
    

# Setup default user, when enter docker container
USER ${UID}:${GID}
WORKDIR /home/${USER}


CMD sudo sysctl kernel.randomize_va_space=0 && zsnes
