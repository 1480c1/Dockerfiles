set(image "xeon_base_ubuntu1804")
set(build_os "ubuntu")
set(build_os_ver "18.04")
set(build_tools "DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y -q --no-install-recommends build-essential autoconf make git wget pciutils cpio libtool lsb-release ca-certificates pkg-config bison flex
")
set(build_libdir "lib/x86_64-linux-gnu")
configure_file(../../BaseDockerfile.cmake.in ${CMAKE_CURRENT_BINARY_DIR}/Dockerfile @ONLY)