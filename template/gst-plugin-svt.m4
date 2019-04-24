# Build gstremaer plugin for svt

RUN cd SVT-HEVC/gstreamer-plugin && \
    cmake . && \
    make -s -j20 >/dev/null && \
    make -s install DESTDIR=/home/build && \
    make -s install

RUN cd SVT-VP9/gstreamer-plugin && \
    cmake . && \
    make -s -j20 >/dev/null && \
    make -s install DESTDIR=/home/build && \
    make -s install

RUN cd SVT-AV1/gstreamer-plugin && \
    cmake . && \
    make -s -j20 >/dev/null && \
    make -s install DESTDIR=/home/build && \
    make -s install
