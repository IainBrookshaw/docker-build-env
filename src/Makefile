#
# Makefile for hello_world program
# 
# Note: this will only work _inside_ the docker container!

${dst}/hello_world: ${dst}/hello_world.o
	g++ -o ${dst}/hello_world ${dst}/hello_world.o 

${dst}/hello_world.o: hello_world.cpp
	g++ -o ${dst}/hello_world.o -c hello_world.cpp