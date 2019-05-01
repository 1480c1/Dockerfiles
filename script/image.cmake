file(GLOB M4_FILES *.m4)
foreach(m4File ${M4_FILES})
    string(REPLACE ".m4" "" strippedm4File ${m4File})
    add_custom_command(OUTPUT ${strippedm4File}
                   COMMAND ${M4_EXE} -I${templateDir} -DDOCKER_IMAGE=${image} > ${strippedm4File}
                   COMMENT "Generating ${strippedm4File}")
    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/Dockerfile ${CMAKE_CURRENT_BINARY_DIR}/Dockerfile COPYONLY)
    set(strippedm4Files
        ${strippedm4File}
        ${strippedm4Files})
endforeach()
if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/Dockerfile)
    file(STRINGS ${CMAKE_CURRENT_SOURCE_DIR}/Dockerfile
        AS_BUILD REGEX "AS build")
    add_custom_target(build_${image} ALL)
    if(AS_BUILD MATCHES "AS build")
        add_custom_command(TARGET build_${image}
            COMMAND sudo docker build --network=host --target build -t "${image}:build" .)
    endif()
    if(NOT dockerUsername)
        set(dockerUsername "1480c1")
    endif()
    if(NOT dockerHubRepo)
        set(dockerHubRepo "dockerfiles")
    endif()
    add_custom_command(TARGET build_${image}
        COMMAND sudo docker build --network=host -t "${dockerUsername}/${dockerHubRepo}:${image}" .)
endif()
if(dep_image)
    add_dependencies(build_${image} build_${dep_image})
endif()
add_custom_target(shell_${image} "${CMAKE_CURRENT_SOURCE_DIR}/shell.sh")
