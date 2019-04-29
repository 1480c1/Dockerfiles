FROM ubuntu:16.04 AS build
WORKDIR /home

#build ISPC

ARG ISPC_VER=1.9.1
ARG ISPC_REPO=https://downloads.sourceforge.net/project/ispcmirror/v${ISPC_VER}/ispc-v${ISPC_VER}-linux.tar.gz
RUN wget -qO - ${ISPC_REPO} | tar xz
ENV ISPC_EXECUTABLE=/home/ispc-v${ISPC_VER}-linux/ispc

#build embree

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y -q --no-install-recommends libtbb-dev libgl1-mesa-dev

ARG EMBREE_REPO=https://github.com/embree/embree.git
ARG EMBREE_VER=df0b324
RUN git clone ${EMBREE_REPO} && \
    mkdir embree/build && \
    cd embree/build && \
    git checkout ${EMBREE_VER} && \
    cmake .. -Wno-dev -DEMBREE_TUTORIALS=OFF && \
    make -j 8 && \
    make install

#build ospray

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y -q --no-install-recommends libglfw-dev libgl1-mesa-dri libxrandr-dev  libxinerama-dev libxcursor-dev

ARG OSPRAY_VER=c42a885
ARG OSPRAY_REPO=https://github.com/ospray/ospray.git
RUN git clone ${OSPRAY_REPO} && \
    mkdir ospray/build && \
    cd ospray/build && \
    git checkout ${OSPRAY_VER} && \
    cmake .. && \
    make -j 8
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/ospray/build

#include(ospray-example_xfrog.m4)

FROM build
LABEL Description="This is the base image for ospray Ubuntu 16.04 LTS"
LABEL Vendor="Intel Corporation"
WORKDIR /home
