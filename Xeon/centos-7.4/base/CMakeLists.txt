set(BUILD_OS "centos")
set(OS_VERSION "7.4.1708")
set(AS_NEEDED "AS")
set(AS_IMAGE "base")
set(PKG_MANAGER "yum install -y -q")
set(INSTALL_PACKAGES "bzip2 git time wget zlib-devel make autoconf libtool ca-certificates pkg-config gcc gcc-c++ bison flex patch epel-release")
set(BUILD_LIB_DIR "lib64")
set(REPOS "wget -q  -O - ${AUTOMAKE_REPO} | tar xJ && \
wget -q  -O - ${CMAKE_REPO}/v${CMAKE_VER%.*}/cmake-${CMAKE_VER}.tar.gz | tar xz && \
")
 # Get package repos
RUN @REPOS@

# Install cmake
RUN cd cmake-${CMAKE_VER} && \
    ./bootstrap --prefix=/usr && \
    make -s -j10 && make -s install

# Build AUTOMAKE
RUN cd automake-${AUTOMAKE_VER} && \
    ./configure --prefix=/usr --libdir=${configure_libdir} && \
    make -s -j10 && make -s install

# Build NASM
RUN cd nasm-${NASM_VER} && \
    ./autogen.sh && \
    ./configure --prefix=/usr --libdir=${configure_libdir} && \
    make -s -j10 && make -s install

# Build YASM
RUN cd yasm-${YASM_VER} && \
    sed -i "s/) ytasm.*/)/" Makefile.in && \
    ./configure --prefix="/usr" --libdir=${configure_libdir} && \
    make -s -j10 && make -s install
