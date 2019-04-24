# Build QATZip
ARG QATZIP_VER=v0.2.7
ARG QATZIP_REPO=https://github.com/intel/QATzip/archive/${QATZIP_VER}.tar.gz

RUN wget -q  -O - ${QATZIP_REPO} | tar xz && mv QATzip-${QATZIP_VER} QATzip && \
    cd QATzip && \
    ./configure --with-ICP_ROOT=/home/qat-driver --prefix=/opt/qat && \
    make -s -j20 >/dev/null && \
    mkdir -p /opt/qat/lib && \
    mkdir -p /opt/qat/bin && \
    mkdir -p /opt/qat/include && \
    make -s install && \
    cp /usr/include/qatzip.h /opt/qat/include;
