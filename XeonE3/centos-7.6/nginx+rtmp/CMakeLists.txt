set(image "xeone3-centos76-nginx-rtmp")
set(dep_image "xeone3-centos76-ffmpeg")
include("${CMAKE_SOURCE_DIR}/script/image.cmake")
include("${CMAKE_SOURCE_DIR}/script/nginx-tests.cmake")
