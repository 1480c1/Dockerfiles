set(image "${cpuType}-centos74-nginx-rtmp")
set(dep_image "${cpuType}-centos74-ffmpeg")
include("${CMAKE_SOURCE_DIR}/script/image.cmake")
include("${CMAKE_SOURCE_DIR}/script/nginx-tests.cmake")
