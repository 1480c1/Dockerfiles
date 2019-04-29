cmake_minimum_required (VERSION 2.8)

Project(DockerFiles NONE)
set(PROJECT_VERSION "1.0")
enable_testing()

set(build_cmake_ver "3.14.3")
set(build_automake_ver "1.16.1")
set(build_nasm_ver "2.13.03")
set(build_yasm_ver "1.3.0")
set(build_dldt_ver "2018_R5")
set(build_embree_ver "df0b324")
set(build_ffmpeg_ver "n4.1")
set(build_gmmlib_ver "intel-gmmlib-18.3.0")
set(build_gst_orc_ver "0.4.28")
set(build_gst_ver "1.14.4")
set(build_paho_ver "1.3.0")
set(build_va_gstreamer_plugins_ver "0.3.1")
set(build_ispc_ver "1.9.1")
set(build_aom_ver "b6f1767eedbaddeb1ff5aa409a710ef61078640e")
set(build_libdrm_ver "2.4.96")
set(build_fdk_aac_ver "v0.1.6")
set(build_mp3lame "3.100")
set(build_ogg_ver "1.3.3")
set(build_opus_ver "1.2.1")
set(build_librdkafka_ver "0.11.6")
set(build_libva_utils_ver "2.4.0")
set(build_libva_ver "2.4.0")
set(build_vorbis_ver "1.3.6")
set(build_vpx_ver "tags/v1.7.0")
set(build_x264_ver "stable")
set(build_x265_ver "2.9")
set(build_media_driver_ver "intel-media-kbl-19.1.0")
set(build_msdk_ver "MSS-KBL-2019-R1")
set(build_nginx_qat_ver "v0.3.6")
set(build_nginx_rtmp_ver "v1.2.1")
set(build_nginx_ver "1.14.2")
set(build_intel_compute_runtime_ver "19.01.12103")
set(build_opencv_ver "4.1.0")
set(build_openexr_ver "0ac2ea3")
set(build_openimageio_ver "5daa9a1")
set(build_ospray_ver "c42a885")
set(build_python_ver "3.6.6")
set(build_qat_driver_ver "1.7.l.4.3.0-00033")
set(build_qat_engine_ver "v0.5.39")
set(build_qat_openssl_ver "OpenSSL_1_1_1")
set(build_qatzip_ver "v0.2.7")
set(build_svt_av1_ver "90b56a80795d4d0448673c4c7276ce6d5c8ac9d4")
set(build_svt_hevc_ver "20a47b0d904e9d99e089d93d7c33af92788cbfdb")
set(build_svt_vp9_ver "d18b4acf9139be2e83150e318ffd3dba1c432e74")
set(build_transform360_ver "280ccf7")

set(cpuTypes
    VCA2
    Xeon
    XeonE3)
set(buildOSs
    centos-7.4
    centos-7.5
    centos-7.6
    ubuntu-16.04
    ubuntu-18.04)
find_program(M4_EXE NAMES m4)
if(NOT M4_EXE)
    message(FATAL_ERROR "m4 not found in PATH.\nPlease install m4")
endif()
set(templateDir "${PROJECT_SOURCE_DIR}/template")

foreach(cpuType ${cpuTypes})
    foreach(buildOS ${buildOSs})
        file(GLOB dirs "${cpuType}/${buildOS}/*")
        foreach(dir ${dirs})
            if(IS_DIRECTORY ${dir} AND EXISTS ${dir}/CMakeLists.txt)
                add_subdirectory(${dir})
            endif()
        endforeach()
    endforeach()
endforeach()

# legal message
message(STATUS
    "\nThis script will build third party components licensed under various open source licenses into your container images."
    "The terms under which those components may be used and distributed can be found with the license document that is provided with those components."
    "Please familiarize yourself with those terms to ensure your distribution of those components complies with the terms of those licenses.\n\n")