#!/usr/bin/env bash
#
# Simple script to use the image from 'build-docker-image.bash' to compile
# the c++ code in 'src'
#
_this_dir="$( cd "$(dirname "$0")" ; pwd -P )"
pushd `pwd` > /dev/null 2>&1
cd $_this_dir

source_dir="$(cd ../../ && pwd)/src"
output_dir="$(cd ../../ && pwd)/build"
image_name=$1

if [ -z $image_name ]; then
    echo "Error: please provide a valid docker image tag as first arg"
    exit 1
fi
if [ ! -d $source_dir ]; then
    echo "Error: source directory \"$source_dir\" does not exist!"
    exit 1
fi
if [ ! -d $output_dir ]; then
    echo "BuildCode: creating output directory \"$output_dir\""
    if ! mkdir -p $output_dir; then exit 1; fi
fi

echo
echo "BuildCode: starting dockerized c++ code build"
echo "BuildCode: code build image: \"$image_name\""
echo "BuildCode: code source:      \"$source_dir\""
echo "BuildCode: code dst:         \"$output_dir\""
echo 

echo "BuildCode: Container output:"
docker run --rm \
    --name "cpp-build" \
    -u $(id -u ${USER}):$(id -g ${USER}) \
    --volume $source_dir:/cpp-build-volumes/src:rw \
    --volume $output_dir:/cpp-build-volumes/artifacts:rw \
    $image_name

if [[ "$?" == "0" ]]; then
    echo
    echo "BuildCode: build complete. Run './build/hello_world' to see result"
    exit 0
fi
exit 1