#build embree
ifelse(index(DOCKER_IMAGE,ubuntu),-1,,dnl
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y -q --no-install-recommends libtbb-dev libgl1-mesa-dev
)dnl
ifelse(index(DOCKER_IMAGE,centos),-1,,dnl
RUN yum install -y -q tbb-devel mesa-libGL-devel
)dnl
RUN mkdir embree/build && \
    cd embree/build && \
    cmake .. -Wno-dev -DEMBREE_TUTORIALS=OFF && \
    make -s -j10 && \
    make -s install
