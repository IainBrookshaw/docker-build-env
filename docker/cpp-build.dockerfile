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
FROM alpine:3.11

RUN apk update && apk upgrade && apk add --virtual \
    build-dependencies \
    build-base \
    gcc \
    bash

RUN mkdir -p /cpp-build-volumes/artifacts
RUN mkdir -p /cpp-build-volumes/src
VOLUME [ "/cpp-build-volumes/artifacts", "/cpp-build-volumes/src" ]
ENV CPP_SOURCE_DIR="/cpp-build-volumes/src"
ENV CPP_BUILD_DIR="/cpp-build-volumes/artifacts"

COPY scripts/container-build-code.bash /

ENTRYPOINT [ "/bin/bash", "-c", "/container-build-code.bash" ]