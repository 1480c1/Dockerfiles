# Build vpx
ARG VPX_VER=tags/v1.7.0
ARG VPX_REPO=https://chromium.googlesource.com/webm/libvpx.git

define(`FFMPEG_CONFIG_VPX',--enable-libvpx )dnl
RUN git clone --recurse-submodules -j8 --depth 1 -b ${VPX_VER} ${VPX_REPO} && \
    cd libvpx && \
    ./configure --prefix="/usr" --libdir=ifelse(index(DOCKER_IMAGE,ubuntu),-1,/usr/lib64,/usr/lib/x86_64-linux-gnu) --enable-defn(`BUILD_LINKAGE') --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --as=nasm && \
    make -j8 && \
    make install DESTDIR=/home/build && \
    make install
