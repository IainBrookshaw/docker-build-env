#!/usr/bin/env bash

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
make
if [ "$?" != "0" ]; then
    echo "Error: unable to build code!"
    exit 1
fi