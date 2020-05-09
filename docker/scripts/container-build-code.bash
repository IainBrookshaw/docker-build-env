#!/usr/bin/env bash
#
# This is a container-side script. It will be copied into the container by
# 'docker build'
#
# This isn't strictly necessary, and could all be run from ENTRYPOINT. But I
# like to have checks

if [ -z $CPP_SOURCE_DIR ]; then
    echo "Error: container environement var 'CPP_SOURCE_DIR' not set"
    exit 1
fi
if [ ! -d $CPP_SOURCE_DIR ]; then
    echo "Error: container code source directory \"$CPP_SOURCE_DIR\" does not exist"
    exit 1
fi
if [ ! -d $CPP_BUILD_DIR ]; then
    echo "Error: container code build directory \"$CPP_BUILD_DIR\" does not exist"
    exit 1
fi

cd $CPP_SOURCE_DIR
make dst=${CPP_BUILD_DIR}
if [ "$?" != "0" ]; then
    echo "Error: unable to build code!"
    exit 1
fi