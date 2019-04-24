# Build the gstremaer plugin good set
ifelse(index(DOCKER_IMAGE,ubuntu),-1,,
RUN  apt-get update && apt-get install -y -q --no-install-recommends libsoup2.4-dev libjpeg-dev
)dnl
ifelse(index(DOCKER_IMAGE,centos),-1,,
RUN  yum install -y -q libsoup-devel libjpeg-devel
)dnl

RUN  cd gst-plugins-good-${GST_VER} && \
     ./autogen.sh \
        --prefix=/usr \
        --libdir=/usr/ifelse(index(DOCKER_IMAGE,ubuntu),-1,lib64,lib/x86_64-linux-gnu) \
        --libexecdir=/usr/ifelse(index(DOCKER_IMAGE,ubuntu),-1,lib64,lib/x86_64-linux-gnu) \
        --enable-defn(`BUILD_LINKAGE') \
        --disable-examples ifelse(index(DOCKER_IMAGE,-dev),-1,--disable-debug) \
        --disable-gtk-doc && \
     make -s -j10 && \
     make -s install DESTDIR=/home/build && \
     make -s install

define(`INSTALL_PKGS_GST_PLUGIN_GOOD',dnl
ifelse(index(DOCKER_IMAGE,ubuntu),-1,libsoup libjpeg-turbo ,libsoup2.4-1 libjpeg8 libjpeg-turbo8 ))dnl
