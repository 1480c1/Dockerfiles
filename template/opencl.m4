#install OpenCL

ifelse(index(DOCKER_IMAGE,ubuntu),-1,,
RUN mkdir neo

ARG INTEL_COMPUTE_RUNTIME_VER=19.01.12103

RUN cd neo && wget https://github.com/intel/compute-runtime/releases/download/${INTEL_COMPUTE_RUNTIME_VER}/intel-gmmlib_18.4.0.348_amd64.deb
RUN cd neo && wget https://github.com/intel/compute-runtime/releases/download/${INTEL_COMPUTE_RUNTIME_VER}/intel-igc-core_18.50.1270_amd64.deb
RUN cd neo && wget https://github.com/intel/compute-runtime/releases/download/${INTEL_COMPUTE_RUNTIME_VER}/intel-igc-opencl_18.50.1270_amd64.deb
RUN cd neo && wget https://github.com/intel/compute-runtime/releases/download/${INTEL_COMPUTE_RUNTIME_VER}/intel-opencl_19.01.12103_amd64.deb

RUN cd neo && \
    dpkg -i *.deb && \
    dpkg-deb -x intel-gmmlib_18.4.0.348_amd64.deb /home/build/ && \
    dpkg-deb -x intel-igc-core_18.50.1270_amd64.deb /home/build/ && \
    dpkg-deb -x intel-igc-opencl_18.50.1270_amd64.deb /home/build/ && \
    dpkg-deb -x intel-opencl_19.01.12103_amd64.deb /home/build/
)dnl

ifelse(index(DOCKER_IMAGE,centos),-1,,
RUN yum install -y -q dnf dnf-plugins-core

RUN yum install -y yum-plugin-copr
RUN yum copr enable -y arturh/intel-opencl
RUN yum install -y -q intel-opencl
RUN yum install -y epel-release
RUN yum install -y ocl-icd libgomp
)dnl


#clinfo needs to be installed after build directory is copied over
define(`INSTALL_OPENCL',dnl
ifelse(index(DOCKER_IMAGE,ubuntu),-1,,
RUN apt-get update && apt-get install -y clinfo
)dnl
ifelse(index(DOCKER_IMAGE,centos),-1,,
RUN yum install -y -q dnf dnf-plugins-core yum-plugin-copr
RUN yum copr enable -y arturh/intel-opencl
RUN yum install -y -q intel-opencl
RUN yum install -y epel-release
RUN yum install -y ocl-icd libgomp
RUN ln -s /usr/lib64/libOpenCL.so.1 /usr/lib/libOpenCL.so
)dnl
)dnl
