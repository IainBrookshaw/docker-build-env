#
# Makefile for hello_world program
# 
# Note: this will only work _inside_ the docker container!

DST_DIR="/cpp-build-volumes/artifacts"

${DST_DIR}/hello_world: ${DST_DIR}/hello_world.o
	g++ -o ${DST_DIR}/hello_world ${DST_DIR}/hello_world.o 

${DST_DIR}/hello_world.o: hello_world.cpp
	g++ -o ${DST_DIR}/hello_world.o -c hello_world.cpp