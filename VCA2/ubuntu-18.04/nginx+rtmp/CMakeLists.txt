set(image "${cpuType}-ubuntu1804-nginx-rtmp")
set(dep_image "${cpuType}-ubuntu1804-ffmpeg")
include("${CMAKE_SOURCE_DIR}/script/image.cmake")
include("${CMAKE_SOURCE_DIR}/script/nginx-tests.cmake")
