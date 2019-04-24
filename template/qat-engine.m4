# Build QAT Engine
ARG QAT_ENGINE_VER=v0.5.39
ARG QAT_ENGINE_REPO=https://github.com/intel/QAT_Engine/archive/${QAT_ENGINE_VER}.tar.gz

RUN wget -q  -O - ${QAT_ENGINE_REPO} | tar xz && mv QAT_Engine-${QAT_ENGINE_VER} QAT_Engine && \
    cd QAT_Engine && \
    ./autogen.sh && \
    ./configure --with-qat_dir=/home/qat-driver --with-openssl_dir=/home/openssl --with-openssl_install_dir=/opt/openssl --enable-upstream_driver --enable-usdm --prefix=/opt/qat && \
    PERL5LIB=/home/openssl make -s -j20 >/dev/null && \
    PERL5LIB=/home/openssl make -s install DESTDIR=/home/build && \
    PERL5LIB=/home/openssl make -s install
