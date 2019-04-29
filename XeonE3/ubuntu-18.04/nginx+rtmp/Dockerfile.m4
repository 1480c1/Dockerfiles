FROM 1480c1/dockerfiles:ubuntu1804base AS build
WORKDIR /home
define(`BUILD_LINKAGE',shared)dnl
define(`BUILD_TOOLS_NO_ASM')dnl

include(nginx-rtmp.m4)
include(nginx.m4)dnl

FROM xeone3-ubuntu1804-ffmpeg:latest
LABEL Description="This is the base image for a NGINX+RTMP service"
LABEL Vendor="Intel Corporation"
WORKDIR /home

# Prerequisites
include(install.pkgs.m4)
# Install
include(install.m4)
