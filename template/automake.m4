# Install automake, use version 1.14 on CentOS
ifelse(index(DOCKER_IMAGE,ubuntu),-1,
        cd automake-${AUTOMAKE_VER} && \
    ./configure --prefix=/usr --libdir=/usr/ifelse(index(DOCKER_IMAGE,ubuntu),-1,lib64,lib/x86_64-linux-gnu) --disable-doc && \
    make -s -j10 && \
    make -s install
,dnl
    RUN apt-get install -y -q automake
)dnl
