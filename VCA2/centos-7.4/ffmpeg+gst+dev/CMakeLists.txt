set(image "${cpuType}-centos74-ffmpeg-gst-dev")
include("${CMAKE_SOURCE_DIR}/script/image.cmake")
include("${CMAKE_SOURCE_DIR}/script/ffmpeg-tests.cmake")
include("${CMAKE_SOURCE_DIR}/script/gst-tests.cmake")
