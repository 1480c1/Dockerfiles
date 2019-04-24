# COMMON BUILD TOOLS
ifelse(index(DOCKER_IMAGE,ubuntu),-1,dnl
RUN yum install -y bzip2 git time wget zlib-devel make autoconf libtool ca-certificates pkg-config gcc gcc-c++ bison flex patch epel-release;
,dnl
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y -q --no-install-recommends build-essential autoconf make git wget -q  pciutils cpio libtool lsb-release ca-certificates pkg-config bison flex
)dnl

include(cmake.m4)
include(automake.m4)
ifdef(`BUILD_TOOLS_NO_ASM',,`dnl
include(nasm.m4)
include(yasm.m4)dnl
')dnl
