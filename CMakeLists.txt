cmake_minimum_required (VERSION 2.8)

Project(DockerFiles NONE)
enable_testing()

set(cpuTypes
    VCA2
    Xeon
    XeonE3)
set(buildOSs
    centos-7.4
    centos-7.5
    centos-7.6
    ubuntu-16.04
    ubuntu-18.04)

foreach(cpuType ${cpuTypes})
    foreach(buildOS ${buildOSs})
        file(GLOB dirs "${cpuType}/${buildOS}/*")
        foreach(dir ${dirs})
            if(IS_DIRECTORY ${dir} AND EXISTS ${dir}/CMakeLists.txt)
                add_subdirectory(${dir})
            endif()
        endforeach()
    endforeach()
endforeach()

# legal message
message(STATUS
    "\nThis script will build third party components licensed under various open source licenses into your container images."
    "The terms under which those components may be used and distributed can be found with the license document that is provided with those components."
    "Please familiarize yourself with those terms to ensure your distribution of those components complies with the terms of those licenses.\n\n")