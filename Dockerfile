FROM ubuntu:xenial AS build_step
LABEL maintainer Ryan Shaw <ryan@rshaw.me>

RUN set -ex ; \
    mkdir -p /garlicoin ; \
    apt-get update -y    ; \
     	apt-get install -yq \
        git                 \
        build-essential     \
        libtool             \
        autotools-dev       \
        automake            \
        pkg-config          \
        libssl-dev          \
        libtool             \
        uuid-dev            \
        libevent-dev        \
        bsdmainutils        \
        libboost-all-dev    \
		software-properties-common ; \ 
	add-apt-repository ppa:bitcoin/bitcoin ; \ 
	apt-get update ; \
	apt-get install -yq libdb4.8-dev libdb4.8++-dev wget

RUN set -ex ; \
    cd /tmp ; \
    wget http://download.zeromq.org/zeromq-4.0.5.tar.gz; \
    tar xvzf zeromq-4.0.5.tar.gz ; \
    cd zeromq-4.0.5 ; \
    ./configure ; \
    make install ; \
    ldconfig

VOLUME ["/output"]

ADD src/build.sh /

ENTRYPOINT [ "/build.sh" ]