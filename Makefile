run:
	nvidia-docker run -it --rm -v /disk2/wangkechun:/src/ -p 2233:22 --name myubuntu --hostname myubuntu myubuntu:20180315 zsh

build:
	docker build -t myubuntu:20180315 .

all: build run
