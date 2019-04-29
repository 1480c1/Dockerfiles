set(image "xeon-centos74-nginx-rtmp")
set(dep_image "xeon-centos74-ffmpeg")
include("${CMAKE_SOURCE_DIR}/script/image.cmake")
include("${CMAKE_SOURCE_DIR}/script/nginx-tests.cmake")
