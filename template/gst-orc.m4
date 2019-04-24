# Build the gstremaer plugin bad set
RUN  cd orc-${GST_ORC_VER} && \
    ./autogen.sh --prefix=/usr --libdir=/usr/ifelse(index(DOCKER_IMAGE,ubuntu),-1,lib64,lib/x86_64-linux-gnu) \
        --libexecdir=/usr/ifelse(index(DOCKER_IMAGE,ubuntu),-1,lib64,lib/x86_64-linux-gnu) \
        --enable-defn(`BUILD_LINKAGE') \
        --disable-examples ifelse(index(DOCKER_IMAGE,-dev),-1,--disable-debug) \
        --disable-gtk-doc && \
     make -s -j10 && \
     make -s install DESTDIR=/home/build && \
     make -s install
