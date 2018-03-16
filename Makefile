run:
	nvidia-docker run -it --rm -v /disk2/wangkechun:/src/ -p 2233:22 -p 8888:8888 -p 8000:8000 --name myubuntu --hostname myubuntu myubuntu:20180315 

run-daemon:
	NV_GPU=7  nvidia-docker run --log-driver json-file -d -v /disk2/wangkechun:/src/ -p 2233:22 -p 8888:8888 -p 8000:8000 --name myubuntu --hostname myubuntu myubuntu:20180315 
rm:
	docker rm -f myubuntu

build:
	docker build -t myubuntu:20180315 .

all: build run
