FROM centos:7.4.1708 AS build
WORKDIR /home

# COMMON BUILD TOOLS
RUN yum install -y -q autoconf bison boost-devel bzip2 ca-certificates \
    centos-release-scl devtoolset-7 epel-release flex freetype-devel gcc \
    gcc-c++ git glibc-devel glibc-static libass-devel libgcc libpciaccess-devel \
    libstdc++ libstdc++-devel libstdc++-static libtool libusbx-devel make \
    numactl-devel openblas-devel openssl-devel patch pkg-config wget -q  zlib-devel; \
    yum install -y -q autoconf bison boost-devel bzip2 ca-certificates \
    centos-release-scl devtoolset-7 epel-release flex freetype-devel gcc \
    gcc-c++ git glibc-devel glibc-static libass-devel libgcc libpciaccess-devel \
    libstdc++ libstdc++-devel libstdc++-static libtool libusbx-devel make \
    numactl-devel openblas-devel openssl-devel patch pkg-config wget zlib-devel;

# Install cmake
RUN cd cmake-${CMAKE_VER} && \
    ./bootstrap --prefix="/usr" && \
    make -s -j10 && \
    make -s install

# Install automake, use version 1.14 on CentOS
RUN cd automake-${AUTOMAKE_VER} && \
    ./configure --prefix=/usr --libdir=/usr/lib64 --disable-doc && \
    make -s -j10 && \
    make -s install

# Build NASM
RUN cd nasm-${NASM_VER} && \
    ./autogen.sh && \
    ./configure --prefix="/usr" --libdir=/usr/lib64 && \
    make -s -j10 && \
    make -s install

# Build YASM
RUN cd yasm-${YASM_VER} && \
    sed -i "s/) ytasm.*/)/" Makefile.in && \
    ./configure --prefix="/usr" --libdir=/usr/lib64 && \
    make -s -j10 && \
    make -s install

# Build ogg
RUN cd libogg-${OGG_VER} && \
    ./configure --prefix="/usr" --libdir=/usr/lib64 --enable-shared && \
    make -s -j10 && \
    make -s install DESTDIR=/home/build && \
    make -s install

# Build vorbis
RUN cd libvorbis-${VORBIS_VER} && \
    ./configure --prefix="/usr" --libdir=/usr/lib64 --enable-shared && \
    make -s -j10 && \
    make -s install DESTDIR=/home/build && \
    make -s install

# Build mp3lame
RUN cd lame-${MP3LAME_VER} && \
    ./configure --prefix="/usr" --libdir=/usr/lib64 --enable-shared --enable-nasm && \
    make -s -j10 && \
    make -s install DESTDIR=/home/build && \
    make -s install

# Build fdk-aac
RUN cd fdk-aac && \
    autoreconf -fiv && \
    ./configure --prefix="/usr" --libdir=/usr/lib64 --enable-shared && \
    make -s -j10 && \
    make -s install DESTDIR=/home/build && \
    make -s install


# Build opus
RUN cd opus-${OPUS_VER} && \
    ./configure --prefix="/usr" --libdir=/usr/lib64 --enable-shared && \
    make -s -j10 && \
    make -s install DESTDIR=/home/build && \
    make -s install

# Build vpx
RUN cd libvpx && \
    ./configure --prefix="/usr" --libdir=/usr/lib64 --enable-shared --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --as=nasm && \
    make -s -j10 && \
    make -s install DESTDIR=/home/build && \
    make -s install


# Build AOM
RUN mkdir aom/aom_build && \
    cd aom/aom_build && \
    cmake -DBUILD_SHARED_LIBS=ON -DENABLE_NASM=ON -DENABLE_TESTS=OFF -DENABLE_DOCS=OFF -DCMAKE_INSTALL_PREFIX="/usr" -DLIB_INSTALL_DIR=/usr/lib64 .. && \
    make -s -j10 && \
    make -s install DESTDIR="/home/build" && \
    make -s install

# Build x264
RUN cd x264 && \
    ./configure --prefix="/usr" --libdir=/usr/lib64 --enable-shared && \
    make -s -j10 && \
    make -s install DESTDIR="/home/build" && \
    make -s install


# Build x265
RUN cd x265/build/linux && \
    cmake -DBUILD_SHARED_LIBS=ON -DENABLE_TESTS=OFF -DCMAKE_INSTALL_PREFIX=/usr -DLIB_INSTALL_DIR=/usr/lib64 ../../source && \
    make -s -j10 && \
    make -s install DESTDIR="/home/build" && \
    make -s install

# Fetch SVT-HEVC
RUN cd SVT-HEVC/Build/linux && \
    mkdir -p ../../Bin/Release && \
    ( source /opt/rh/devtoolset-7/enable && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib64 -DCMAKE_ASM_NASM_COMPILER=yasm ../.. && \
    make -s -j10 && \
    make -s install DESTDIR=/home/build && \
    make -s install )


# Fetch SVT-AV1
RUN cd SVT-AV1/Build/linux && \
    mkdir -p ../../Bin/Release && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib64 -DCMAKE_ASM_NASM_COMPILER=yasm ../.. && \
    make -s -j10 && \
    make -s install DESTDIR=/home/build && \
    make -s install

#Remove build residue from SVT-AV1 build -- temp fix for bug
RUN if [ -d "build/home/" ]; then rm -rf build/home/; fi

# Fetch SVT-VP9
RUN cd SVT-VP9/Build/linux && \
    mkdir -p ../../Bin/Release && \
    ( source /opt/rh/devtoolset-7/enable && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib64 -DCMAKE_ASM_NASM_COMPILER=yasm ../.. && \
    make -s -j10 && \
    make -s install DESTDIR=/home/build && \
    make -s install )

#include(transform360.m4)
# Build DLDT-Inference Engine
RUN cd dldt && \
    cd inference-engine && \
    wget -q  -O - ${DLDT_C_API_REPO} | patch -p2 && \
    mkdir build && \
    cd build && \
    cmake  -DCMAKE_INSTALL_PREFIX=/opt/intel/dldt -DLIB_INSTALL_PATH=/opt/intel/dldt -DENABLE_MKL_DNN=ON -DENABLE_CLDNN=OFF -DENABLE_SAMPLE_CORE=OFF  .. && \
    make -s -j10 && \
    rm -rf ../bin/intel64/Release/lib/libgtest* && \
    rm -rf ../bin/intel64/Release/lib/libgmock* && \
    rm -rf ../bin/intel64/Release/lib/libmock* && \
    rm -rf ../bin/intel64/Release/lib/libtest*

RUN mkdir -p /opt/intel/dldt/inference-engine/include && \
    cp -r dldt/inference-engine/include/* /opt/intel/dldt/inference-engine/include && \
    mkdir -p ${libdir} && \
    cp -r dldt/inference-engine/bin/intel64/Release/lib/* ${libdir} && \
    mkdir -p /opt/intel/dldt/inference-engine/src && \
    cp -r dldt/inference-engine/src/* /opt/intel/dldt/inference-engine/src/ && \
    mkdir -p /opt/intel/dldt/inference-engine/share && \
    cp -r dldt/inference-engine/build/share/* /opt/intel/dldt/inference-engine/share/ && \
    mkdir -p /opt/intel/dldt/inference-engine/external/omp/lib && \
    cp -r dldt/inference-engine/temp/omp/lib/* /opt/intel/dldt/inference-engine/external/omp/lib/

RUN mkdir -p build/opt/intel/dldt/inference-engine/include && \
    cp -r dldt/inference-engine/include/* build/opt/intel/dldt/inference-engine/include && \
    mkdir -p build${libdir} && \
    cp -r dldt/inference-engine/bin/intel64/Release/lib/* build${libdir} && \
    mkdir -p build/opt/intel/dldt/inference-engine/src && \
    cp -r dldt/inference-engine/src/* build/opt/intel/dldt/inference-engine/src/ && \
    mkdir -p build/opt/intel/dldt/inference-engine/share && \
    cp -r dldt/inference-engine/build/share/* build/opt/intel/dldt/inference-engine/share/ && \
    mkdir -p build/opt/intel/dldt/inference-engine/external/omp/lib && \
    cp -r dldt/inference-engine/temp/omp/lib/* build/opt/intel/dldt/inference-engine/external/omp/lib/

RUN for p in /usr /home/build/usr /opt/intel/dldt/inference-engine /home/build/opt/intel/dldt/inference-engine; do \
    pkgconfiglibdir="$p/lib64" && \
    mkdir -p "${pkgconfiglibdir}/pkgconfig" && \
    pc="${pkgconfiglibdir}/pkgconfig/dldt.pc" && \
    echo "prefix=/opt" > "$pc" && \
    echo "libdir=${libdir}" >> "$pc" && \
    echo "includedir=/opt/intel/dldt/inference-engine/include" >> "$pc" && \
    echo "" >> "$pc" && \
    echo "Name: DLDT" >> "$pc" && \
    echo "Description: Intel Deep Learning Deployment Toolkit" >> "$pc" && \
    echo "Version: 5.0" >> "$pc" && \
    echo "" >> "$pc" && \
    echo "Libs: -L\${libdir} -linference_engine -linference_engine_c_wrapper" >> "$pc" && \
    echo "Cflags: -I\${includedir}" >> "$pc"; \
    done;

ENV InferenceEngine_DIR=/opt/intel/dldt/inference-engine/share
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/intel/dldt/inference-engine/lib:/opt/intel/dldt/inference-engine/external/omp/lib:${libdir}

#install Model Optimizer in the DLDT for Dev



# Build librdkafka
RUN cd librdkafka-${LIBRDKAFKA_VER} && \
    ./configure --prefix=/usr --libdir=/usr/lib64 && \
    make -s -j10 && \
    make -s install DESTDIR=/home/build && \
    make -s install;

# Fetch FFmpeg source
RUN cd FFmpeg && \
    wget -q  -O - ${FFMPEG_FLV_PATCH_REPO} | patch -p1 && \
    wget -q  -O - ${FFMPEG_1TN_PATCH_REPO} | patch -p1 && \
    wget -q  -O - ${FFMPEG_THREAD_PATCH_REPO} | patch -p1 && \
    wget -q  -O - ${FFMPEG_MA_PATCH_REPO_01} | patch -p1 && \
    wget -q  -O - ${FFMPEG_MA_PATCH_REPO_02} | patch -p1 && \
    wget -q  -O - ${FFMPEG_MA_PATCH_REPO_03} | patch -p1 && \
    wget -q  -O - ${FFMPEG_MA_PATCH_REPO_04} | patch -p1 && \
    wget -q  -O - ${FFMPEG_MA_PATCH_REPO_05} | patch -p1 && \
    wget -q  -O - ${FFMPEG_MA_PATCH_REPO_06} | patch -p1 && \
    wget -q  -O - ${FFMPEG_MA_PATCH_REPO_07} | patch -p1 && \
    wget -q  -O - ${FFMPEG_MA_PATCH_REPO_08} | patch -p1 && \
    wget -q  -O - ${FFMPEG_MA_PATCH_REPO_09} | patch -p1 && \
    wget -q  -O - ${FFMPEG_MA_PATCH_REPO_10} | patch -p1;

# Patch FFmpeg source for SVT-HEVC
RUN cd /home/FFmpeg && \
    patch -p1 < ../SVT-HEVC/ffmpeg_plugin/0001-lavc-svt_hevc-add-libsvt-hevc-encoder-wrapper.patch;

# Patch FFmpeg source for SVT-AV1
RUN cd /home/FFmpeg; \
    patch -p1 < ../SVT-AV1/ffmpeg_plugin/0001-Add-ability-for-ffmpeg-to-run-svt-av1-with-svt-hevc.patch;

# Compile FFmpeg
RUN cd /home/FFmpeg && \
    ./configure --prefix="/usr" --libdir=/usr/lib64 --extra-libs="-lpthread -lm" --enable-shared --enable-gpl --enable-libass --enable-libfreetype --disable-xlib --disable-sdl2 --enable-openssl --enable-nonfree --disable-vaapi --disable-hwaccels --disable-doc --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --enable-libfdk-aac --enable-libmp3lame --enable-libopus --enable-libvorbis --enable-libvpx --enable-libx264 --enable-libx265 --enable-libaom --enable-libsvthevc --enable-libsvtav1 --enable-libinference_engine --enable-librdkafka  && \
    make -s -j10 && \
    make -s install DESTDIR="/home/build"


# Clean up after build
RUN rm -rf /home/build/usr/include && \
    rm -rf /home/build/usr/share/doc && \
    rm -rf /home/build/usr/share/gtk-doc && \
    rm -rf /home/build/usr/share/man && \
    find /home/build -name "*.a" -exec rm -f {} \;

FROM centos:7.4.1708
LABEL Description="This is the image for DLDT and FFMPEG on CentOS 7.4" \
    Vendor="Intel Corporation"
WORKDIR /home

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/intel/dldt/inference-engine/lib:/opt/intel/dldt/inference-engine/external/omp/lib:${libdir} \
    InferenceEngine_DIR=/opt/intel/dldt/inference-engine/share
ARG libdir=/opt/intel/dldt/inference-engine/lib/centos_7.4/intel64
# Prerequisites
RUN yum install -y epel-release; \
    yum install -y -q libass numactl; \
    yum remove -y -q epel-release; \
    rm -rf /var/cache/yum/*;
# Install
COPY --from=build /home/build /