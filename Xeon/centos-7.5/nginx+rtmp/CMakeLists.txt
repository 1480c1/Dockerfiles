set(image "xeon-centos75-nginx-rtmp")
set(dep_image "xeon-centos75-ffmpeg")
include("${CMAKE_SOURCE_DIR}/script/image.cmake")
include("${CMAKE_SOURCE_DIR}/script/nginx-tests.cmake")
