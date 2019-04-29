FROM centos:7.4.1708 AS build
WORKDIR /home

# COMMON BUILD TOOLS
RUN yum install -y -q bzip2 make autoconf libtool git wget ca-certificates pkg-config gcc gcc-c++ bison flex patch epel-release yum-devel libcurl-devel zlib-devel

ARG CMAKE_VER=3.14.3
ARG AUTOMAKE_VER=1.16.1
ARG NASM_VER=2.13.03
ARG YASM_VER=1.3.0
ARG CMAKE_REPO=https://cmake.org/files
ARG AUTOMAKE_REPO=https://ftp.gnu.org/pub/gnu/automake/automake-${AUTOMAKE_VER}.tar.xz
ARG NASM_REPO=https://www.nasm.us/pub/nasm/releasebuilds/${NASM_VER}/nasm-${NASM_VER}.tar.bz2
ARG YASM_REPO=https://www.tortall.net/projects/yasm/releases/yasm-${YASM_VER}.tar.gz

# Install cmake
# Install automake, use version 1.14 on CentOS
# Build NASM
# Build YASM
RUN wget -qO - ${CMAKE_REPO}/v${CMAKE_VER%.*}/cmake-${CMAKE_VER}.tar.gz | tar xz && \
    cd cmake-${CMAKE_VER} && \
    ./bootstrap --prefix="/usr" && \
    make -j8 && \
    make install && \
    cd /home && \
    rm -rf cmake-${CMAKE_VER} && \
    wget -qO - ${AUTOMAKE_REPO} | tar xJ && \
    cd automake-${AUTOMAKE_VER} && \
    ./configure --prefix=/usr --libdir=/usr/lib64 --disable-doc && \
    make -j8 && \
    make install && \
    cd /home && \
    rm -rf automake-${AUTOMAKE_VER} && \
    wget -qO - ${NASM_REPO} | tar xj && \
    cd nasm-${NASM_VER} && \
    ./autogen.sh && \
    ./configure --prefix="/usr" --libdir=/usr/lib64 && \
    make -j8 && \
    make install && \
    cd /home && \
    rm -rf nasm-${NASM_VER} && \
    wget -qO - ${YASM_REPO} | tar xz && \
    cd yasm-${YASM_VER} && \
    sed -i "s/) ytasm.*/)/" Makefile.in && \
    ./configure --prefix="/usr" --libdir=/usr/lib64 && \
    make -j8 && \
    make install && \
    cd /home && \
    rm -rf yasm-${YASM_VER}
