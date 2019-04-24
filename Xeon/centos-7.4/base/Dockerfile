FROM centos:7.4.1708 AS base

ARG AOM_VER=b6f1767eedbaddeb1ff5aa409a710ef61078640e
ARG AUTOMAKE_VER=1.14
ARG CMAKE_VER=3.13.1
ARG DLDT_VER=2018_R5
ARG EMBREE_VER=df0b324
ARG FDK_AAC_VER=v0.1.6
ARG FFMPEG_VER=n4.1
ARG GST_ORC_VER=0.4.28
ARG GST_VER=1.14.4
ARG ISPC_VER=1.9.1
ARG LIBRDKAFKA_VER=0.11.6
ARG MP3LAME_VER=3.100
ARG NASM_VER=2.13.03
ARG NGINX_RTMP_VER=v1.2.1
ARG NGINX_VER=1.14.2
ARG OGG_VER=1.3.3
ARG OPENCV_VER=4.0.0
ARG OpenEXR_VER=0ac2ea3
ARG OpenImageIO_VER=5daa9a1
ARG OPUS_VER=1.2.1
ARG OSPRAY_VER=c42a885
ARG PAHO_VER=1.3.0
ARG PROTOBUF_VER=master
ARG PYTHON_VER=3.6.6
ARG SVT_AV1_VER=90b56a80795d4d0448673c4c7276ce6d5c8ac9d4
ARG SVT_HEVC_VER=20a47b0d904e9d99e089d93d7c33af92788cbfdb
ARG SVT_VP9_VER=d18b4acf9139be2e83150e318ffd3dba1c432e74
ARG VA_GSTREAMER_PLUGINS_VER=0.3.1
ARG VORBIS_VER=1.3.6
ARG VPX_VER=tags/v1.7.0
ARG X264_VER=stable
ARG X265_VER=2.9
ARG YASM_VER=1.3.0
ENV AOM_REPO=https://aomedia.googlesource.com/aom \
    AUTOMAKE_REPO=https://ftp.gnu.org/pub/gnu/automake/automake-${AUTOMAKE_VER}.tar.xz \
    CMAKE_REPO=https://cmake.org/files \
    DLDT_C_API_REPO=https://raw.githubusercontent.com/VCDP/FFmpeg-patch/master/thirdparty/0001-Add-inference-engine-C-API.patch \
    DLDT_REPO=https://github.com/opencv/dldt.git \
    EMBREE_REPO=https://github.com/embree/embree.git \
    FDK_AAC_REPO=https://github.com/mstorsjo/fdk-aac/archive/${FDK_AAC_VER}.tar.gz \
    FFMPEG_1TN_PATCH_REPO=https://patchwork.ffmpeg.org/patch/11625/raw \
    FFMPEG_FLV_PATCH_REPO=https://raw.githubusercontent.com/VCDP/CDN/master/The-RTMP-protocol-extensions-for-H.265-HEVC.patch \
    FFMPEG_MA_PATCH_REPO_01=https://raw.githubusercontent.com/VCDP/FFmpeg-patch/master/media-analytics/0001-Intel-inference-engine-detection-filter.patch \
    FFMPEG_MA_PATCH_REPO_02=https://raw.githubusercontent.com/VCDP/FFmpeg-patch/master/media-analytics/0002-New-filter-to-do-inference-classify.patch \
    FFMPEG_MA_PATCH_REPO_03=https://raw.githubusercontent.com/VCDP/FFmpeg-patch/master/media-analytics/0003-iemetadata-convertor-muxer.patch \
    FFMPEG_MA_PATCH_REPO_04=https://raw.githubusercontent.com/VCDP/FFmpeg-patch/master/media-analytics/0004-Kafka-protocol-producer.patch \
    FFMPEG_MA_PATCH_REPO_05=https://raw.githubusercontent.com/VCDP/FFmpeg-patch/master/media-analytics/0005-Support-object-detection-and-featured-face-identific.patch \
    FFMPEG_MA_PATCH_REPO_06=https://raw.githubusercontent.com/VCDP/FFmpeg-patch/master/media-analytics/0006-Send-metadata-in-a-packet-and-refine-the-json-format.patch \
    FFMPEG_MA_PATCH_REPO_07=https://raw.githubusercontent.com/VCDP/FFmpeg-patch/master/media-analytics/0007-Refine-features-of-IE-filters.patch \
    FFMPEG_MA_PATCH_REPO_08=https://raw.githubusercontent.com/VCDP/FFmpeg-patch/master/media-analytics/0008-fixed-extra-comma-in-iemetadata.patch \
    FFMPEG_MA_PATCH_REPO_09=https://raw.githubusercontent.com/VCDP/FFmpeg-patch/master/media-analytics/0009-add-source-as-option-source-url-calculate-nano-times.patch \
    FFMPEG_MA_PATCH_REPO_10=https://raw.githubusercontent.com/VCDP/FFmpeg-patch/master/media-analytics/0010-fixed-buffer-overflow-issue-in-iemetadata.patch \
    FFMPEG_REPO=https://github.com/FFmpeg/FFmpeg/archive/${FFMPEG_VER}.tar.gz \
    FFMPEG_THREAD_PATCH_REPO=https://patchwork.ffmpeg.org/patch/11035/raw \
    GST_ORC_REPO=https://gstreamer.freedesktop.org/src/orc/orc-${GST_ORC_VER}.tar.xz \
    GST_PLUGIN_BAD_REPO=https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${GST_VER}.tar.xz \
    GST_PLUGIN_BASE_REPO=https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${GST_VER}.tar.xz \
    GST_PLUGIN_GOOD_REPO=https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${GST_VER}.tar.xz \
    GST_PLUGIN_LIBAV_REPO=https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${GST_VER}.tar.xz \
    GST_PLUGIN_UGLY_REPO=https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${GST_VER}.tar.xz \
    GST_REPO=https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${GST_VER}.tar.xz \
    ISPC_REPO=https://downloads.sourceforge.net/project/ispcmirror/v${ISPC_VER}/ispc-v${ISPC_VER}-linux.tar.gz \
    libdir=/opt/intel/dldt/inference-engine/lib/centos_7.4/intel64 \
    LIBRDKAFKA_REPO=https://github.com/edenhill/librdkafka/archive/v${LIBRDKAFKA_VER}.tar.gz \
    MP3LAME_REPO=https://sourceforge.net/projects/lame/files/lame/${MP3LAME_VER}/lame-${MP3LAME_VER}.tar.gz \
    NASM_REPO=https://www.nasm.us/pub/nasm/releasebuilds/${NASM_VER}/nasm-${NASM_VER}.tar.bz2 \
    NGINX_REPO=https://nginx.org/download/nginx-${NGINX_VER}.tar.gz \
    NGINX_RTMP_PATCH_DASH=https://raw.githubusercontent.com/VCDP/CDN/master/0002-add-HEVC-support-for-dash.patch \
    NGINX_RTMP_PATCH_HLS=https://raw.githubusercontent.com/VCDP/CDN/master/0001-add-hevc-support-for-rtmp-and-hls.patch \
    NGINX_RTMP_REPO=https://github.com/arut/nginx-rtmp-module/archive/${NGINX_RTMP_VER}.tar.gz \
    OGG_REPO=https://downloads.xiph.org/releases/ogg/libogg-${OGG_VER}.tar.xz \
    OPENCV_REPO=https://github.com/opencv/opencv/archive/${OPENCV_VER}.tar.gz \
    OpenEXR_REPO=https://github.com/openexr/openexr.git \
    OpenImageIO_REPO=https://github.com/OpenImageIO/oiio.git \
    OPUS_REPO=https://archive.mozilla.org/pub/opus/opus-${OPUS_VER}.tar.gz \
    OSPRAY_REPO=https://github.com/ospray/ospray.git \
    PAHO_REPO=https://github.com/eclipse/paho.mqtt.c/archive/v${PAHO_VER}.tar.gz \
    PYTHON_REPO=https://www.python.org/ftp/python/${PYTHON_VER}/Python-${PYTHON_VER}.tgz \
    PROTOBUF_REPO=https://github.com/google/protobuf.git \
    PYTHON_TRUSTED_HOST="" \
    PYTHON_TRUSTED_INDEX_URL="" \
    SVT_AV1_REPO=https://github.com/OpenVisualCloud/SVT-AV1 \
    SVT_HEVC_REPO=https://github.com/intel/SVT-HEVC \
    SVT_VP9_REPO=https://github.com/OpenVisualCloud/SVT-VP9 \
    VA_GSTREAMER_PLUGINS_REPO=https://github.com/opencv/gst-video-analytics/archive/v${VA_GSTREAMER_PLUGINS_VER}.tar.gz \
    VORBIS_REPO=https://downloads.xiph.org/releases/vorbis/libvorbis-${VORBIS_VER}.tar.xz \
    VPX_REPO=https://chromium.googlesource.com/webm/libvpx.git \
    X264_REPO=https://github.com/mirror/x264 \
    X265_REPO=https://github.com/videolan/x265/archive/${X265_VER}.tar.gz \
    YASM_REPO=https://www.tortall.net/projects/yasm/releases/yasm-${YASM_VER}.tar.gz

# COMMON BUILD TOOLS
RUN yum install -y bzip2 git time wget zlib-devel make autoconf libtool ca-certificates pkg-config gcc gcc-c++ bison flex patch epel-release

SHELL [ "/usr/bin/time","-p","/bin/bash","-c" ]

# Download repos
RUN wget -q  -O - ${AUTOMAKE_REPO} | tar xJ && \
    wget -q  -O - ${CMAKE_REPO}/v${CMAKE_VER%.*}/cmake-${CMAKE_VER}.tar.gz | tar xz && \
    wget -q  -O - ${FDK_AAC_REPO} | tar xz && mv fdk-aac-${FDK_AAC_VER#v} fdk-aac && \
    wget -q  -O - ${FFMPEG_REPO} | tar xz && mv FFmpeg-${FFMPEG_VER} FFmpeg && \
    wget -q  -O - ${GST_ORC_REPO} | tar xJ && \
    wget -q  -O - ${GST_PLUGIN_BAD_REPO} | tar xJ && \
    wget -q  -O - ${GST_PLUGIN_BASE_REPO} | tar xJ && \
    wget -q  -O - ${GST_PLUGIN_GOOD_REPO} | tar xJ && \
    wget -q  -O - ${GST_PLUGIN_LIBAV_REPO} | tar xJ && \
    wget -q  -O - ${GST_PLUGIN_UGLY_REPO} | tar xJ && \
    wget -q  -O - ${GST_REPO} | tar xJ && \
    wget -q  -O - ${ISPC_REPO} | tar xz && \
    wget -q  -O - ${LIBRDKAFKA_REPO} | tar xz && \
    wget -q  -O - ${MP3LAME_REPO} | tar xz && \
    wget -q  -O - ${NASM_REPO} | tar xj && \
    wget -q  -O - ${NGINX_REPO} | tar xz && \
    wget -q  -O - ${NGINX_RTMP_REPO} | tar xz && mv nginx-rtmp-module-${NGINX_RTMP_VER#v} nginx-rtmp-module && \
    wget -q  -O - ${OGG_REPO} | tar xJ && \
    wget -q  -O - ${OPENCV_REPO} | tar xz && \
    wget -q  -O - ${OPUS_REPO} | tar xz && \
    wget -q  -O - ${PAHO_REPO} | tar -xz && \
    wget -q  -O - ${PYTHON_REPO} | tar xz && \
    wget -q  -O - ${VA_GSTREAMER_PLUGINS_REPO} | tar xz && \
    wget -q  -O - ${VORBIS_REPO} | tar xJ && \
    wget -q  -O - ${X265_REPO} | tar xz && mv x265-${X265_VER} x265 && \
    wget -q  -O - ${YASM_REPO} | tar xz && \
    wget -q  -O - ${YASM_REPO} | tar xz && \
    git clone --recurse-submodules -j8 --depth 1 -b ${AOM_VER} ${AOM_REPO} && \
    git clone --recurse-submodules -j8 --depth 1 -b ${DLDT_VER} ${DLDT_REPO} && \
    git clone --recurse-submodules -j8 --depth 1 -b ${EMBREE_VER} ${EMBREE_REPO} && \
    git clone --recurse-submodules -j8 --depth 1 -b ${OpenEXR_VER} ${OpenEXR_REPO} && \
    git clone --recurse-submodules -j8 --depth 1 -b ${OpenImageIO_VER} ${OpenImageIO_REPO} && \
    git clone --recurse-submodules -j8 --depth 1 -b ${OSPRAY_VER} ${OSPRAY_REPO} && \
    git clone --recurse-submodules -j8 --depth 1 -b ${SVT_AV1_VER} ${SVT_AV1_REPO} && \
    git clone --recurse-submodules -j8 --depth 1 -b ${SVT_HEVC_VER} ${SVT_HEVC_REPO} && \
    git clone --recurse-submodules -j8 --depth 1 -b ${SVT_VP9_VER} ${SVT_VP9_REPO} && \
    git clone --recurse-submodules -j8 --depth 1 -b ${VPX_VER} ${VPX_REPO} && \
    git clone --recurse-submodules -j8 --depth 1 -b ${X264_VER} ${X264_REPO} && \
    git clone --recurse-submodules -j8 --depth 1 -b ${PROTOBUF_VER} ${PROTOBUF_REPO}
RUN wget -q  -O - ${GMMLIB_REPO} | tar xz && mv gmmlib-${GMMLIB_VER} gmmlib;
