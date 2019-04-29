set(image "xeon-ubuntu1604-nginx-rtmp")
set(dep_image "xeon-ubuntu1604-ffmpeg")
include("${CMAKE_SOURCE_DIR}/script/image.cmake")
include("${CMAKE_SOURCE_DIR}/script/nginx-tests.cmake")
