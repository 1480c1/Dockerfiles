if(NOT DEFINED image_dirs)
    file(GLOB image_dirs "*")
endif()

foreach(dir ${image_dirs})
    if(EXISTS ${dir}/build.sh)
        execute_process(COMMAND ${dir}/build.sh -n OUTPUT_QUIET ERROR_QUIET)
    endif()
endforeach()
