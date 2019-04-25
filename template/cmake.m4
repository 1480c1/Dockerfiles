# Install cmake
RUN cd cmake-${CMAKE_VER} && \
    ./bootstrap --prefix="/usr" && \
    make -s -j10 && \
    make -s install