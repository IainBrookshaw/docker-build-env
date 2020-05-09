# Dockerized C++ Build Environment

This is a simple example of fully containerized c++ build. Using this approach
you can build projects with dependencies fully removed from those on your 
system (eg: you could use a different compiler, versions of std, etc.)

While this example uses c++, the same approach could be employed for any 
language. 

## Usage
1. build the docker container: `./docker/scripts/build-docker-image.bash <image-name>`
2. build the source code: `./docker/scripts/build-code.bash <image-name>`
3. run the output executable: `./build/hello_world`

All make/gcc caching should work as normal (run (2) multiple times to see this)

(nb: the image names must match)
When the `build-code.bash` script is run, the project in `src` will be build
and the resultant binaries output to `build`. They should be run-able at that
point


## Things to remember:
- the container base you use must be compatable with your run-time OS
    - this is easier if you've dockerized both the build _and_ runtime
    - this example assumes you just want to control the build, and you're
      using a Ubuntu 18.04 host -- it "may" work for other Debians
    - change the dockerfile if other build environments are needed
        - in a real project, there would be multiple dockerized build envs and
          the code build script would deduce which one was needed for a given
          code build.
- premissions. The output will only work if you have permissions to run it
    - this example uses a default dockerfile user setup (root), but then
      resets the UID and GID to the host user at run-time. This is something
      of a hack, but is a good approach if you don't know the end-user ids
      apriori
    - a better solution is to make the end-user id's input `docker --build-arg`s
      and fix the build image end-user at image build-time 

