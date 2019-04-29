FROM 1480c1/dockerfiles:centos76base AS build
WORKDIR /home
define(`BUILD_LINKAGE',shared)dnl

include(ispc.m4)
include(embree.m4)
include(ospray.m4)
#include(ospray-example_xfrog.m4)

FROM build
LABEL Description="This is the base image for ospray CentOS 7.6"
LABEL Vendor="Intel Corporation"
WORKDIR /home
