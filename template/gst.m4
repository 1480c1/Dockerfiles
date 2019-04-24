# Build the gstremaer core
ifelse(index(DOCKER_IMAGE,ubuntu1604),-1,,
RUN  DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y -q --no-install-recommends libglib2.0-dev gobject-introspection libgirepository1.0-dev libpango-1.0-0 libpangocairo-1.0-0 autopoint
)dnl
ifelse(index(DOCKER_IMAGE,ubuntu1804),-1,,
RUN  ln -sf /usr/share/zoneinfo/UTC /etc/localtime; \
     DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y -q --no-install-recommends libglib2.0-dev gobject-introspection libgirepository1.0-dev libpango-1.0-0 libpangocairo-1.0-0 autopoint
)dnl
ifelse(index(DOCKER_IMAGE,centos),-1,,
RUN  yum install -y -q glib2-devel-2.56.1 gettext-devel gobject-introspection gobject-introspection-devel python-gobject-base
)dnl
RUN cd gstreamer-${GST_VER} && \
    ./autogen.sh \
        --prefix=/usr \
        --libdir=/usr/ifelse(index(DOCKER_IMAGE,ubuntu),-1,lib64,lib/x86_64-linux-gnu) \
        --libexecdir=/usr/ifelse(index(DOCKER_IMAGE,ubuntu),-1,lib64,lib/x86_64-linux-gnu) \
        --enable-defn(`BUILD_LINKAGE') \
        --enable-introspection \
        --disable-examples ifelse(index(DOCKER_IMAGE,-dev),-1, \
        --disable-debug \
        --disable-benchmarks) \
        --disable-gtk-doc && \
    make -s -j10 && \
    make -s install DESTDIR=/home/build && \
    make -s install;
define(`INSTALL_PKGS_GST',dnl
ifelse(index(DOCKER_IMAGE,ubuntu),-1,,libglib2.0 libpango-1.0-0 libpangocairo-1.0-0 gobject-introspection )dnl
ifelse(index(DOCKER_IMAGE,centos),-1,,glib2-2.56.1 pango gobject-introspection ))dnl
