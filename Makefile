run :
	docker run -it --rm -v `pwd`:/src/ -p 2233:22 --name myubuntu --hostname myubuntu myubuntu:20161003 zsh

build :
	docker build -t myubuntu:20161003 .

all : build run
