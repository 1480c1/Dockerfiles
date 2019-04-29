#example for ospray xfrog-forest

ARG EXAMPLE_PATH=http://www.sdvis.org/ospray/download/demos/XFrogForest/xfrog-forest.tar.bz2
ARG EXAMPLE_NAME=xfrog-forest
RUN mkdir example && \
    wget -qO - ${EXAMPLE_PATH} | tar xj -C example
