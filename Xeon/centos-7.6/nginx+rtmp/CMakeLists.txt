set(image "xeon-centos76-nginx-rtmp")
set(dep_image "xeon-centos76-ffmpeg")
include("${CMAKE_SOURCE_DIR}/script/image.cmake")
include("${CMAKE_SOURCE_DIR}/script/nginx-tests.cmake")
