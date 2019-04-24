# Build gstremaer plugin vaapi
ifelse(index(DOCKER_IMAGE,ubuntu),-1,dnl
RUN  yum install -y -q libXrandr-devel
,dnl
RUN  apt-get update && apt-get install -y -q --no-install-recommends libxrandr-dev libegl1-mesa-dev autopoint bison flex libudev-dev
)dnl

#RUN  git clone https://gitlab.freedesktop.org/gstreamer/gstreamer-vaapi.git -b 1.14 --depth 10 && \
#     cd gstreamer-vaapi && git reset --hard ${GST_PLUGIN_VAAPI_REPO_DISPLAY_LOCK_PATCH_HASH} && \
RUN cd gstreamer-vaapi-${GST_VER} && \
    ./autogen.sh \
        --prefix=/usr \
        --libdir=/usr/ifelse(index(DOCKER_IMAGE,ubuntu),-1,lib64,lib/x86_64-linux-gnu) \
        --libexecdir=/usr/ifelse(index(DOCKER_IMAGE,ubuntu),-1,lib64,lib/x86_64-linux-gnu) \
        --enable-defn(`BUILD_LINKAGE') \
        --disable-examples \
        --disable-gtk-doc ifelse(index(DOCKER_IMAGE,-dev),-1,--disable-debug) && \
    make -s -j10 && \
    make -s install DESTDIR=/home/build && \
    make -s install

define(`INSTALL_PKGS_GST_PLUGIN_VAAPI',ifelse(index(DOCKER_IMAGE,ubuntu),-1,libxcb mesa-libGL libXrandr ,libdrm-intel1 libudev1 libx11-xcb1 libgl1-mesa-glx libxrandr2 libegl1-mesa libglib2.0-0 ))dnl
define(`INSTALL_GST_PLUGIN_VAAPI',dnl
ENV GST_VAAPI_ALL_DRIVERS=1
ENV DISPLAY=:0.0
)dnl
