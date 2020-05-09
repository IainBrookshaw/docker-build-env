#!/usr/bin/env bash
#
# simple script to build image
_this_dir="$( cd "$(dirname "$0")" ; pwd -P )"
pushd `pwd` > /dev/null 2>&1
cd $_this_dir

docker_context=$(cd ../../ && pwd)/docker
dockerfile=$(cd ../ && pwd)/cpp-build.dockerfile
image_name="cpp-build:latest" #todo: make this input arg/optarg

echo
echo "ImageBuild: building image:       \"$image_name\""
echo "ImageBuild: from dockerfile:      \"$dockerfile\""
echo "ImageBuild: using docker context: \"$docker_context\""
echo

docker build \
    --file $dockerfile \
    --tag  $image_name \
    $docker_context

if [[ "$?" != "0" ]]; then
    echo "Error image build failed!"
    exit 1
fi
exit 0