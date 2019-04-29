set(image "${cpuType}-ubuntu1804-ffmpeg-gst-dev")
include("${CMAKE_SOURCE_DIR}/script/image.cmake")
include("${CMAKE_SOURCE_DIR}/script/ffmpeg-tests.cmake")
include("${CMAKE_SOURCE_DIR}/script/gst-tests.cmake")
