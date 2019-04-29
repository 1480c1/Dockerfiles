FROM 1480c1/dockerfiles:ubuntu1804base AS build
WORKDIR /home
define(`BUILD_LINKAGE',shared)dnl

include(ispc.m4)
include(embree.m4)
include(ospray.m4)
#include(ospray-example_xfrog.m4)

FROM build
LABEL Description="This is the base image for ospray Ubuntu 18.04"
LABEL Vendor="Intel Corporation"
WORKDIR /home
