#
# Example dockerfile for a C++ build environment
# Copyright (c) Iain Brookshaw 2020
# Al Rights Reserved
#
# This dockerfile produces an image that may be used as a simple C++ build
# environment, building code found in one volume and exporting it to another
#
# the directory 'docker' is expected to be the root of the docker build context
#
FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade && apt-get install -y build-essential

# set up the input and output volumes
RUN mkdir -p /cpp-build-volumes/artifacts
RUN mkdir -p /cpp-build-volumes/src
#
VOLUME [ "/cpp-build-volumes/artifacts", "/cpp-build-volumes/src" ]
ENV CPP_SOURCE_DIR="/cpp-build-volumes/src"
ENV CPP_BUILD_DIR="/cpp-build-volumes/artifacts"

COPY scripts/container-build-code.bash /
ENTRYPOINT [ "/bin/bash", "-c", "/container-build-code.bash" ]