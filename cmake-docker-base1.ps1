
$ErrorActionPreference = "Stop"

$CMAKE_DOCKER_NAME = "cmake_base"
$CMAKE_VERSION = "3.15.4"
$CMAKE_TAR_GZ = "cmake-$($CMAKE_VERSION).tar.gz"
$CMAKE_TAR = "cmake-$($CMAKE_VERSION).tar"
$CMAKE_VERSION_DIR = "cmake-$CMAKE_VERSION"

docker run --name $CMAKE_DOCKER_NAME --detach centos:latest sleep inf

docker exec -it $CMAKE_DOCKER_NAME bash -c "yum update -y && yum install -y gcc make gcc-c++ wget nano"
docker exec -it $CMAKE_DOCKER_NAME bash -c "cd /root && wget -O cmake.tar.gz 'https://github.com/Kitware/CMake/releases/download/v$($CMAKE_VERSION)/$($CMAKE_TAR_GZ)'"
docker exec -it $CMAKE_DOCKER_NAME bash -c "cd /root && tar xvf cmake.tar.gz"
docker exec -it $CMAKE_DOCKER_NAME bash -c "cd /root/$CMAKE_VERSION_DIR && ./configure && make install"
